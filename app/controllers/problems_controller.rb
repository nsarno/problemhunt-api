class ProblemsController < ApplicationController
  before_filter :authenticate

  # POST /problems
  def create
    @problem = @current_user.organization.problems.new(problem_params)

    if @problem.save && @problem.upvote(current_user)
      render json: @problem, status: :created, location: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

private

  def problem_params
    params.require(:problem).permit(:description)
  end
end
