class OrganizationsController < ApplicationController
  before_action :authenticate_unit!, except: %i[index show]
  before_action :check_rules_global_admin, except: %i[index admin_branches show new create edit update set_organization_public_unit destroy]
  before_action :check_rules_global_moderator, except: %i[index admin_branches show edit update set_organization_public_unit ]
  before_action :check_rules_organization_admin, except: %i[index show new create edit update set_organization_public_unit destroy]
  before_action :check_rules_organization_moderator, except: %i[index show edit update set_organization_public_unit]
  before_action :check_rules_departament_admin, except: %i[index show]
  before_action :check_rules_departament_moderator, except: %i[index show]
  before_action :check_rules_user, except: %i[index show]

  def index; end

  def show
    if organization.street.split.count != 1
      @street_name = organization.street.split(" ").join(',+')
    else
      @street_name = organization.street
    end

    if organization.block?
      @build_number = organization.build + organization.block
    else
      @build_number = organization.build
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

  def set_organization_public_unit
    if organization.update(set_organization_public_unit_params)
      flash[:notice] = 'Unit id assigned for organization!'
      @unit = Unit.find(params[:id])
      @unit.update(set_public_for_organization_params)
      flash[:notice] = params[:departament_id]
      redirect_back(fallback_location: root_path)
    end
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

  def set_organization_public_unit_params
    params.require(:organization).permit(:id, :public_unit_id)
  end

  def set_public_for_organization_params
    params.require(:unit).permit(:public_for_organization)
  end

  def organization
    @organization ||= Organization.find(params[:id])
  end
  helper_method :organization
end
