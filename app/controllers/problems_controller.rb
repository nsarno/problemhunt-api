class ProblemsController < ApplicationController
  before_filter :authenticate
  before_filter :set_room
  before_filter :set_problem, only: [:destroy]

  # POST /rooms/:id/problems
  def create
    problem = @room.problems.new(problem_params)

    if problem.save && problem.upvotes.create(user: current_user)
      render json: problem, status: :created, location: room_problem_url(@room, problem)
    else
      render json: problem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/:id/problems/:id
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
