class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  serialization_scope :view_context

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
      @current_user = User.find(payload['user_id'])
      User.current = @current_user
    rescue
      head :unauthorized
    end
  end

  def current_user
    @current_user
  end

  def save_and_render resource
    if resource.save
      render json: resource, status: :created, location: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  helper_method :current_user
  helper_method :authenticate
end
