class OrganizationsController < ApplicationController
  before_filter :authenticate

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

private

  def organization_params
    params.require(:organization).permit(:name)
  end
end
