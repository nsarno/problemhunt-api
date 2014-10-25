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
    begin
      token = request.headers['Authorization'].split(' ').last
      payload, header = AuthToken.valid?(token)
      @current_user = User.find_by(id: payload['user_id'])
    rescue
      head :unauthorized  
    end
  end

  helper_method :authenticate
end

