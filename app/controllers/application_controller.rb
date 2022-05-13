class ApplicationController < ActionController::API

  delegate :t, to: I18n
  before_action :authenticate_user!

  def authenticate_user!
    request.headers['token'].present? ? authenticate_request : super
  end

  private

  def authenticate_request
    decoded_auth_token = Jwt.decode(request.headers['token'])

    # check token already valid
    case decoded_auth_token
    when 403
      render json: { status: 'KO', message: t('api.login.jwt_token_expired')}, status: 403
    when 500
      render json: { status: 'KO', message: t('api.login.jwt_token_error')}, status: 500
    else
      @current_user = User.find(decoded_auth_token[:user_id])
    end
  end
end
