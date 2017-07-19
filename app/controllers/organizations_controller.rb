class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: [:index, :show, :new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save
    if departaments.empty?
      redirect_to new_organization_departament_path(organization)
    else
      redirect_to organization_path(organization)
    end
  end

  def edit
  end

  def update
    if organization.update(organization_params)
      redirect_to branch_organization_path(branch, organization)
    end
  end


  def destroy
    if organization.destroy
      redirect_to branch_organization_path(branch, organization)
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :web_page, :our_skils, :organizationlogotype, :public_presentation_user_id)
  end

  def organization
      @organization ||= Organization.find(params[:id])
  end
  helper_method :organization
end 
 