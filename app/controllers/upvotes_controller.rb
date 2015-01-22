class UpvotesController < ApplicationController
  before_filter :authenticate
  before_filter :set_problem, only: [:create, :destroy]

  # POST /problems/:id/upvote
  def create
    current_user.upvote @problem
    head :created
  end

  # DELETE /problems/:id/downvote
  def destroy
    current_user.downvote @problem
    head :no_content
  end

private

  def set_problem
    @problem = Problem.find(params[:id])  
  end
end
