class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    head :ok
  end

private

  def not_found
    head :not_found
  end

  def authenticate
    logger.debug "AUTHENTICATE"
    begin
      token = request.headers['Authorization'].split(' ').last
      payload, header = AuthToken.valid?(token)
      @current_user = User.find_by(id: payload['user_id'])
      logger.debug "CURRENT_USER"
      logger.debug @current_user
      logger.debug payload['user_id']
    rescue
      head :unauthorized
    end
  end

  def current_user
    @current_user
  end

  helper_method :authenticate
  helper_method :current_user
end
