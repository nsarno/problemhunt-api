class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room

  def create
    current_user.rooms << @room
    head :created
  end

  def destroy
    @room.destroy
    head :no_content
  end

private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
