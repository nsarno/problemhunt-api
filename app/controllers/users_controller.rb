class UsersController < ApplicationController
 before_filter :authenticate, except: [:create]
 before_filter :set_user, only: [:show, :update, :destroy]

  def show
    render json: @user
  end

  def create
    save_and_render User.new(user_params)
  end

  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

