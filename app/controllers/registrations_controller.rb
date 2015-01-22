class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room, only: [:create, :destroy]

  def create
    current_user.follow @room
    head :created
  end

  def destroy
    current_user.unfollow @room
    head :no_content
  end

private

  def set_room
    @room = Room.find(params[:id])
  end
end
