class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def new; end

  def create
    @organization = Organization.new(organization_params)

    redirect_to organizations_path if @organization.save
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])

    redirect_to organizations_path if @organization.update(organization_params)
  end

  def destroy
    @organization = Organization.find(params[:id])
    redirect_to organizations_path if @organization.destroy
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :phone, :email)
  end
end
