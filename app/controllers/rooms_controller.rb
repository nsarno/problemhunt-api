class RoomsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room, only: [:show]

  # GET /rooms
  # GET /rooms?name=param
  def index
    if params[:name]
      render json: Room.where(name: params[:name])
    else
      render json: Room.all
    end
  end

  # GET /rooms/:id
  def show
    render json: @room
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

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
