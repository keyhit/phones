class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: [ :registration_new_unit, :save_new_unit]
  before_action :check_rules_global_admin, except: [ :index, :admin_branches, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_global_moderator, except: [ :index, :admin_branches, :show, :edit, :update]
  before_action :check_rules_organization_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_organization_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_departament_admin , except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_departament_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_user, except: [:index, :show, :units_self_admin]
  before_action :organizations_isolation, if: [ :role_3, :role_4, :role_5, :role_6, :role_7 ]
  before_action :check_rules_user_when_registering


  def index
  end

  def show
  end

  def registration_new_unit
  end

  def save_new_unit
    @save_unit = Unit.new(unit_params)
    if @save_unit.save
      flash[:notice] = 'Unit saved!'
      flash[:notice] = @save_unit.id
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
    if @unit.save!
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

  def update_foreign_ids
    @update_foreign_ids = Unit.where(id: current_unit.id)
    if @update_foreign_ids.update(unit_params)
      if current_unit.branch_id and current_unit.organization_id == 'nil' and current_unit.departament_id == 'nil'
        flash[:notice] = 'Branch id updated!'
        redirect_to new_branch_organization_path(branch_id: current_unit.branch_id)
      end
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

