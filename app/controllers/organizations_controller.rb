class OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all

    render json: @organizations
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])

    render json: @organization
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    if @organization.update(params[:organization])
      head :no_content
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    head :no_content
  end
end
