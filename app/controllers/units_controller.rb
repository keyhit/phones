class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: [ :registration_new_unit, :save_new_unit]
  before_action :check_rules_global_admin, except: [ :index, :admin_branches, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_global_moderator, except: [ :index, :admin_branches, :show, :edit, :update]
  before_action :check_rules_organization_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy, :update_account, :update_unit_branch_id]
  before_action :check_rules_organization_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_departament_admin , except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_departament_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_user, except: [:index, :show, :units_self_admin]
  before_action :organizations_isolation, except: [:update_unit_branch_id, :update_account]
  before_action :check_rules_user_when_registering, only: [:update_account, :update_unit_branch_id]


  def index
  end

  def show
  end

  def registration_new_unit
  end

  def save_new_unit
    @save_unit = Unit.new(unit_params)
    if @save_unit.save
      flash[:notice] = 'Unit was saved!'
      redirect_to new_unit_session_path()
    else
      flash[:error] = 'Unit was not saved!'
      redirect_to branches_path()
    end
  end

  def new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      flash[:error] = 'Unit was not saved!'
      redirect_to branch_organization_departament_units_path(branch, organization, departament)
    else
      @new_unit.errors
      flash[:error] = 'Unit was not saved!'
      redirect_to new_branch_organization_departament_unit_path(branch_id: params[:branch_id], organization_id: params[:organization_id], departament_id: params[:departament_id])
    end

  end

  def edit
  end

  def update
    if unit.update(unit_params)
      redirect_to branch_organization_departament_unit_path(branch, organization, departament, unit.id)
    end
  end

  def update_account
  end

  def update_unit_branch_id
    @update_unit_branch_id = Unit.where(id: current_unit.id)
    if @update_unit_branch_id.update(unit_params)
        redirect_to update_account_path()
    end
  end

  def destroy
    if unit.destroy
      redirect_to branch_organization_departament_units_path(branch, organization, departament)
    end
  end

  def new_password
    if current_unit.id != unit.id
      redirect_to organization_departament_units_path(organization, departament)
    end
  end

  def units_self_admin
    if current_unit.id != unit.id
      redirect_to organization_departament_units_path(organization, departament)
    end
  end

  private

  
  def unit_params
    params.require(:unit).permit(:full_name, :belong_to_departament, :post, :email, :secondary_email, :password, :password_confirmation, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :unitphoto, :characteristic, :role, :subordinate, :branch_id, :organization_id, :departament_id)
    end

    def reg_params
      params.fetch(:unit).permit(:full_name, :email, :password, :password_confirmation)
    end

  def units
    @units ||= departament.units
  end
  helper_method :units

  def unit
    @unit ||= departament.units.find(params[:id])
  end
  helper_method :unit

end

