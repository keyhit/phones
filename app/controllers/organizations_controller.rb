class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: %i[index show]
  before_action :check_rules_global_admin, except: %i[index admin_branches show new create edit update set_public_unit_id unset_public_unit_id destroy]
  before_action :check_rules_global_moderator, except: %i[index admin_branches show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_organization_admin, except: %i[index show new create edit update set_public_unit_id unset_public_unit_id destroy]
  before_action :check_rules_organization_moderator, except: %i[index show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_departament_admin, except: %i[index show]
  before_action :check_rules_departament_moderator, except: %i[index show]
  before_action :check_rules_user, except: %i[index show]

  def index; end

  def show
    @street_name = if organization.street.split.count != 1
                     organization.street.split(' ').join(',+')
                   else
                     organization.street
                   end

    @build_number = if organization.block?
                      organization.build + organization.block
                    else
                      organization.build
                    end
  end

  def new; end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:success] = 'Organization saved!'
      @unit_for_organization_create = Unit.find(current_unit.id)
      @unit_for_organization_create.update(organization_id: @organization.id)
      redirect_to update_account_path
    else
      flash[:error] = 'Organization was not saved!'
    end
  end

  def edit; end

  def update
    if organization.update(organization_params)
      redirect_to branch_organization_path(branch, organization)
    end
  end

  def set_public_unit_id
    if organization.update(set_unset_public_unit_id_params) && Unit.set_public_for_organization(params[:organization][:organization_id], params[:organization][:public_unit_id])
      flash[:notice] = 'Unit id assigned for organization! Set public for organization!'
    else
      flash[:error] = 'Unit id NOT assigned for organization! ERROR setting public for organization'
    end
    redirect_back fallback_location: root_path
  end

  def unset_public_unit_id
    if organization.update(set_unset_public_unit_id_params) && Unit.unset_public_for_organization(params[:organization][:organization_id])
      flash[:notice] = 'Unit id UNassigned for organization! UNSet public for organization!'
    else
      flash[:error] = 'Unit id STILL assigned for organization! ERROR setting public for organization'
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    if organization.destroy
      flash[:notice] = 'Organization has been destroyed!'
      redirect_to branch_path(branch)
    else
      flash[:error] = 'Organization was not destroyed!'
      redirect_to branch_path(organization)
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :country, :state, :region, :town, :street, :build, :block, :office, :subordinated, :address, :web_page, :our_skils, :organizationlogotype, :public_unit_id, :branch_id)
  end

  def set_unset_public_unit_id_params
    params.require(:organization).permit(:public_unit_id)
  end

  def organization
    @organization ||= Organization.find(params[:id])
  end
  helper_method :organization
end
