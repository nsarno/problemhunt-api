class UpvotesController < ApplicationController
  before_filter :authenticate
  before_filter :set_problem, only: [:create]
  before_filter :set_user, only: [:create]

  # POST /upvotes
  def create
    @upvote = @problem.upvotes.new(user: @user)

    if @upvote.save
      render json: @upvote, status: :created, location: @upvote
    else
      render json: @upvote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /upvotes/:id
  def destroy
    upvote = Upvote.find(params[:id])
    upvote.destroy
    head :no_content
  end

private

  def set_problem
    @problem = Problem.find(params[:problem_id])  
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def upvote_params
    params.require(:upvote).permit(:problem_id, :user_id)
  end
end
