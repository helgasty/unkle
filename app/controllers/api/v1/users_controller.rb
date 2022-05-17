class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  before_action :set_user_collection, only: [:list]
  load_and_authorize_resource

  def create
    user = User.new(user_params)
    user.save!

    render json: { results: user }, status: 200
  rescue => e

    render json: { results: t('api.users.create.error', { error_message: e.message }) }, status: 500
  end

  def my_account
    render json: @current_user, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def list
    render json: @users, status: 200
  end

  def destroy
    @user.destroy

    render json: { results: t('api.users.destroy.success') }, status: 200
  rescue => e

    render json: { results: t('api.users.destroy.error', { error_message: e.message }) }, status: 500
  end

  private

  def set_user
    #TODO : fix raise exception if contract not found
    @user = User.find_by_id(params[:id])
  end

  def set_user_collection
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birth_date, :role)
  end
end