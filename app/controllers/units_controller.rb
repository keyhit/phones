class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: %i[registration_new_unit save_new_unit]
  before_action :check_rules_global_admin, except: %i[index admin_branches show new create edit update update_account update_unit_branch_id destroy new_password write_new_password locale]
  before_action :check_rules_global_moderator, except: %i[index admin_branches show edit update new_password write_new_password locale]
  before_action :check_rules_organization_admin, except: %i[index show new create edit update destroy update_account update_unit_branch_id find_name new_password write_new_password locale]
  before_action :check_rules_organization_moderator, except: %i[index show new create edit update new_password write_new_password locale]
  before_action :check_rules_departament_admin, except: %i[index show new create edit update destroy new_password write_new_password locale]
  before_action :check_rules_departament_moderator, except: %i[index show edit update new_password write_new_password locale]
  before_action :check_rules_user, except: %i[index show unit_edit unit_edit_action new_password write_new_password locale]
  before_action :organizations_isolation, except: %i[update_unit_branch_id update_account locale]

  def index; end

  def show; end

  # def registration_new_unit
  #   @save_unit = Unit.new
  # end

  # def save_new_unit
  #   @save_unit = Unit.new(unit_params)
  #   if @save_unit.save
  #     flash[:notice] = 'Unit was saved!'
  #     redirect_to new_unit_session_path
  #   else
  #     flash[:error] = 'Unit was not saved!'
  #     render :registration_new_unit
  #   end
  # end

  def new
    @unit = Unit.new
  end

  def create
    binding.pry
    @unit = Unit.new(unit_params)
    if @unit.save
      flash[:notice] = 'Unit was saved!'
      redirect_to branch_organization_departament_units_path(branch, organization, departament)
    else
      flash[:error] = 'Unit was not saved!'
      render :new
    end
  end

  def edit
  end

  def update
    if unit.update(unit_params)
      flash[:notice] = 'Unit has been edited!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament, unit)
    else
      flash[:error] = 'Unit is not edited!'
      render :edit
    end
  end

  def update_account; end

  def update_unit_branch_id
    @update_unit_branch_id = Unit.where(id: current_unit.id)

    if @update_unit_branch_id.update(unit_params)
      flash[:success] = 'Branch ID was updated!'
      redirect_to update_account_path
    else
      flash[:error] = 'Branch ID was not updated!'
      redirect_to update_account_path
    end
  end

  def destroy
    if unit.destroy
      flash[:notice] = 'Unit has been destroyed!'
      redirect_to branch_organization_departament_units_path(branch, organization, departament)
    else
      flash[:error] = 'Unit is not destroyed!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament)
    end
  end

  def new_password; end

  def write_new_password
    if unit.update(write_new_password_params)
      flash[:notice] = 'New password was saved!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament)
    else
      flash[:error] = 'New password was not saved!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament)
    end
  end

  def unit_edit; end

  def unit_edit_action
    if unit.update(unit_edit_action_params)
      flash[:notice] = 'User data was saved!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament)
    else
      flash[:error] = 'User data was not saved!'
      redirect_to branch_organization_departament_unit_path(branch, organization, departament)
    end
  end

  def locale
    current_unit.update(unit_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :surename, :patronymic, :subordinated, :post, :email, :secondary_email, :password, :password_confirmation, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :unitphoto, :characteristic, :role, :locale, :branch_id, :organization_id, :departament_id)
    end

  def reg_params
    params.fetch(:unit).permit(:name, :surename, :patronymic, :email, :password, :password_confirmation)
  end

  def write_new_password_params
    params.require(:unit).permit(:password, :password_confirmation)
  end

  def unit_edit_action_params
    params.require(:unit).permit(:secondary_email, :secondary_phone_number, :home_phone_number, :working_days)
  end

  def units_locale
    params.require(:unit).permit(:locale)
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
