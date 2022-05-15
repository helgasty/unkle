class Api::V1::ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: [:show, :subscribe, :unsubscribe]
  before_action :set_contract_collection, only: [:list]

  include ContractsHelper

  def create
    # check params users - options are present
    if params[:contract].has_key?(:users) && params[:contract].has_key?(:options)
      contract = Contract.new(contract_params)
      contract.options = Option.where(code: params[:contract][:options])
      contract.save!

      # subscribe users to contract
      params[:contract][:users].each do |user_email|
        subscribe_contract(User.find_by_email(user_email), contract)
      end

      render json: { results: contract }, status: 200
    else

      render json: { results: t('api.contracts.create.validates.presenkce.users_options') }, status: 500
    end
  rescue => e
    render json: { results: t('api.contracts.create.error', { error_message: e.message }) }, status: 500
  end

  def my_contracts
    contracts = Subscription.where(user: @current_user, end_subscription_at: nil).map(&:contract)

    render json: format_collection(contracts), status: 200
  end

  def list
    render json: format_collection(@contracts), status: 200
  end

  def show
    render json: format(@contract), status: 200
  end

  def subscribe
    if @current_user.contracts.ids.include?(params[:id].to_i)
      render json: { results: t('api.subscriptions.subscribe.already_exist') }, status: 500
    elsif @contract.nil?
      render json: { results: t('api.subscriptions.subscribe.not_exist') }, status: 200
    else
      subscribe_contract(@current_user, @contract)

      render json: { results: t('api.subscriptions.subscribe.success') }, status: 200
    end
  rescue => e

    render json: { results: t('api.subscriptions.subscribe.error', error_message: e.message ) }, status: 500
  end

  def unsubscribe
    if params[:email].present? && !@current_user.admin?
      render json: { results: t('api.access.denied') }, status: 403
    else
      user = (params[:email].present? ? User.find_by_email(params[:email]) : @current_user)
      subscription = Subscription.find_by(user: user, contract: @contract, end_subscription_at: nil)
      if subscription.nil?
        render json: { results: t('api.subscriptions.unsubscribe.not_exist') }, status: 200
      else
        # if no date set, set end_subscription_at to today
        en_subscription_at = params[:end_subscription_at].present? ? Date.parse(params[:en_subscription_at]) : Date.today
        subscription.update(end_subscription_at: en_subscription_at)

        render json: { results: t('api.subscriptions.unsubscribe.success') }, status: 200
      end
    end
  rescue => e

    render json: { results: t('api.subscriptions.unsubscribe.error', { error_message: e.message }) }, status: 500
  end

  def subscribe_contract(user, contract)
    Subscription.create(user: user, contract: contract, subscribed_at: Date.today)
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def set_contract_collection
    @contracts = Contract.all.includes(:options, :users, :subscriptions)
  end

  def contract_params
    params.require(:contract).permit(:numero, :details, :amount, :begin_date, :end_date)
  end
end