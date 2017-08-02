class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: [:index, :show]
  before_action :check_rules_global_admin, except: [ :index, :admin_branches, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_global_moderator, except: [ :index, :admin_branches, :show, :edit, :update]
  before_action :check_rules_organization_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_organization_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_departament_admin , except: [:index, :show]
  before_action :check_rules_departament_moderator , except: [:index, :show]
  before_action :check_rules_user, except: [:index, :show]

  def index
  end

  def show
        # binding.pry
  end

  def new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = 'Organization saved!'
      flash[:notice] = @organization.id
      @unit_for_organization_create = Unit.find(current_unit.id)
      @unit_for_organization_create.update(organization_id: @organization.id)
      redirect_to update_account_path()
    else
      flash[:error] = 'Organization was not saved!'
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
    params.require(:organization).permit(:name, :address, :web_page, :our_skils, :organizationlogotype, :public_presentation_user_id, :branch_id)
  end

  def organization
      @organization ||= Organization.find(params[:id])
  end
  helper_method :organization
end 
 