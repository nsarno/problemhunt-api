class RoomsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room, only: [:show]
  before_filter :set_owned_room, only: [:update, :destroy]

  # GET /rooms
  # GET /rooms?name=param
  def index
    rooms = Room.includes(:problems, :registrations, :users, :owner)
    if params[:name]
      render json: rooms.where(name: params[:name])
    else
      render json: rooms
    end
  end

  # GET /rooms/:id
  def show
    render json: @room
  end

  # POST /rooms
  def create
    save_and_render current_user.owned_rooms.new(room_params)
  end

  # PUT/PATCH /rooms/:id
  def update
    if @owned_room.update(room_params)
      head :no_content
    else
      render json: @owned_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/:id
  def destroy
    @owned_room.destroy
    head :no_content
  end

private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_owned_room
    @owned_room = current_user.owned_rooms.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :topic)
  end
end
