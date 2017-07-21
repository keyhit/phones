class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: [:index, :show]
  # before_action :check_rules_global_admin, only: [:*]
  # before_action :check_rules_global_moderator, only: [:destroy]
  # before_action :check_rules_organization_admin, only: [:*]
  # before_action :check_rules_organization_moderator , except: [:index]
  # before_action :check_rules_departament_admin , except: [:index, :show]
  # before_action :check_rules_departament_moderator , except: [:index, :show]
  # before_action :check_rules_user , except: [:index, :show]
  # before_action :check_rules_unregistred_user, except: [:index, :show]

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
 