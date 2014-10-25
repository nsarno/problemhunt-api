class ProblemsController < ApplicationController
  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all

    render json: @problems
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])

    render json: @problem
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(params[:problem])

    if @problem.save
      render json: @problem, status: :created, location: @problem
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])

    if @problem.update(params[:problem])
      head :no_content
    else
      render json: @problem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    head :no_content
  end
end
