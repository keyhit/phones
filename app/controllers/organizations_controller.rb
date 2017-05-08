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
    @first_departament_id = organization.departaments.ids[0]
    if @organization.save and @first_departament_id == nil
      redirect_to new_organization_departament_path(organization)
    else
      redirect_to organization_path(organization)
    end
  end

  def edit
  end

  def update
    if organization.update(organization_params)
      redirect_to organization_path(organization)
    end
  end

  def destroy
    if organization.destroy
      redirect_to organizations_path
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :phone, :email, :our_skils, :organizationlogotype)
  end

  def organization
      @organization ||= Organization.find(params[:id])
  end
  helper_method :organization
end
