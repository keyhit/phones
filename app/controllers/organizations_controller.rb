class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organization_path(organization)
    end
  end

  def edit
  end

  def update
    if organization.update(organization_params)
      redirect_to organizations_path
    end
  end

  def destroy
    if organization.destroy
      redirect_to organizations_path
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :phone, :email)
  end

  def organization
      @organization ||= Organization.find(params[:id])
  end
  helper_method :organization

end
