module Api
  module V1
    class AuthController < ApplicationController

      include Devise::Controllers::Helpers
      skip_before_action :authenticate_user!

      def login
        if params.has_key?(:user) && params[:user].has_key?(:email) && params[:user].has_key?(:password)

          # check user exist
          user = User.find_by_email(params[:user][:email])

          if user.nil?
            render json: { status: 'KO', message: t('api.login.login_failed')}, status: 500
          else
            if user.valid_password?(params[:user][:password])
              sign_in(:user, user)

              # if user sign_in successfully, generate new JWT token
              render json: { status: 'OK', message: t('api.login.login_success'), token: Jwt.encode(user_id: user.id) },  status: 200
            else
              render json: { status: 'KO', message: t('api.login.password_failed')}, status: 403
            end
          end
        else
          render json: { status: 'KO', message: t('api.login.bad_request')}, status: 500
        end
      end
    end
  end
end
