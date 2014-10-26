class UpvotesController < ApplicationController
  # GET /upvotes
  # GET /upvotes.json
  def index
    @upvotes = Upvote.all

    render json: @upvotes
  end

  # GET /upvotes/1
  # GET /upvotes/1.json
  def show
    @upvote = Upvote.find(params[:id])

    render json: @upvote
  end

  # POST /upvotes
  # POST /upvotes.json
  def create
    @upvote = Upvote.new(params[:upvote])

    if @upvote.save
      render json: @upvote, status: :created, location: @upvote
    else
      render json: @upvote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /upvotes/1
  # PATCH/PUT /upvotes/1.json
  def update
    @upvote = Upvote.find(params[:id])

    if @upvote.update(params[:upvote])
      head :no_content
    else
      render json: @upvote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /upvotes/1
  # DELETE /upvotes/1.json
  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy

    head :no_content
  end
end
