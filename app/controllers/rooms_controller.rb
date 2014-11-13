class RoomsController < ApplicationController
  before_filter :authenticate

  # GET /rooms
  def index
    if params[:name]
      render json: Room.where(name: params[:name])
    else
      render json: Room.all
    end
  end

  # GET /rooms/:id
  # GET /rooms/:name
  def show
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

private

  def room_params
    params.require(:room).permit(:name)
  end
end
