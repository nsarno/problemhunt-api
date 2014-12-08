class UpvotesController < ApplicationController
  before_filter :authenticate
  before_filter :set_problem, only: [:create]
  before_filter :set_upvote, only: [:destroy]

  # POST /upvotes
  def create
    save_and_render @problem.upvotes.new(user: current_user)
  end

  # DELETE /upvotes/:id
  def destroy
    @upvote.destroy
    head :no_content
  end

private

  def set_problem
    @problem = Problem.find(params[:problem_id])  
  end

  def set_upvote
    @upvote = current_user.upvotes.find(params[:id])
  end

  def upvote_params
    params.require(:upvote).permit(:problem_id, :user_id)
  end
end
