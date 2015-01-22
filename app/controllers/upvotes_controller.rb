class UpvotesController < ApplicationController
  before_filter :authenticate
  before_filter :set_problem, only: [:create, :destroy]
  before_filter :set_upvote, only: [:destroy]

  # POST /problems/:id/upvote
  def create
    save_and_render @problem.upvotes.new(user: current_user), @problem
  end

  # DELETE /problems/:id/downvote
  def destroy
    @upvote.destroy
    head :no_content
  end

private

  def set_problem
    @problem = Problem.find(params[:id])  
  end

  def set_upvote
    @upvote = current_user.upvotes.find_by!(problem_id: @problem.id)
  end
end
