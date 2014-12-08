class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room, only: [:create]
  before_filter :set_registration, only: [:destroy]

  def create
    save_and_render @room.registrations.new(user: current_user)
  end

  def destroy
    @registration.destroy
    head :no_content
  end

private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_registration
    @registration = current_user.registrations.find(params[:id])
  end
end
