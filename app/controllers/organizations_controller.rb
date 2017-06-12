class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: [:index, :show, :new, :create]

  def index
    @organizations = Organization.all
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
    if current_unit.global_admin?
      global_admin_role
    elsif current_unit.global_moderator?
      global_moderator_role
    elsif current_unit.organization_admin?
      organization_admin_role
    elsif current_unit.organization_moderator?
      organization_moderator_role
    else
      redirect_to organization_path()
    end
  end

  def update
    def update_organization
      if organization.update(organization_params)
        redirect_to organization_path(organization)
      end
    end
    if current_unit.global_admin?
      global_admin_role
      update_organization
    elsif current_unit.global_moderator?
      global_moderator_role
      update_organization
    elsif current_unit.organization_admin?
      organization_admin_role
      update_organization
    elsif current_unit.organization_moderator?
      organization_moderator_role
      update_organization
    else
      redirect_to organization_path(organization)
    end
  end

  def destroy
    def deletion_organization
      if organization.destroy
        redirect_to organizations_path()
      end
    end
    if current_unit.global_admin?
      global_admin_role
      deletion_organization
    elsif current_unit.global_moderator?
      global_moderator_role
      deletion_organization
    elsif current_unit.organization_admin?
      organization_admin_role
      deletion_organization
    else
      redirect_to organization_path(organization)
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
