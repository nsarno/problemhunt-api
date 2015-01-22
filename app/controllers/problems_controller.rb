class ProblemsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room, only: [:index, :create]
  before_filter :set_problem, only: [:destroy]

  # GET /rooms/:id/problems
  def index
    render json: @room.problems.includes(:user, upvotes: :user)
  end

  # POST /rooms/:id/problems
  def create
    save_and_render current_user.problems.new problem_params.merge(room_id: @room.id)
  end

  # DELETE /problems/:id
  def destroy
    @problem.destroy
    head :no_content
  end

private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_problem
    @problem = current_user.problems.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:description)
  end
end
