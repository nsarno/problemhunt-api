class AuthController < ApplicationController
  before_filter :set_user, only: [:create]

  def create
    
    render json: { 
      token: AuthToken.issue_token({ user_id: @user.id }),
      user_id: @user.id
    }
  end

private

  def set_user
    @user = User.find_by(email: auth_params[:email])
    @user = User.create(auth_params) unless @user.present?  
    head :unauthorized unless @user.authenticate(auth_params[:password]) 
  end

  def auth_params
    params.require(:user).permit :email, :password
  end
end

