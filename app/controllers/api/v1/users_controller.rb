class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.create(user_params)
    render json: { results: user }, status: 200
  end

  def show
    render json: @current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :first_name, :last_name, :birth_date)
  end
end