class RegistrationsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room
  before_filter :set_registration, only: [:destroy]

  def create
    registration = @room.registrations.new(user: current_user)

    if registration.save
      render json: registration, status: :created, location: registration
    else
      render json: registration.errors, status: :unprocessable_entity
    end
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
