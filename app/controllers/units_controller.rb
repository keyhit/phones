class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: [:new, :create]

  def index
    if current_unit.global_admin?
      global_admin_role
    elsif current_unit.global_moderator?
      global_moderator_role
    elsif current_unit.organization_admin?
      organization_admin_role
    elsif current_unit.organization_moderator?
      organization_moderator_role
    elsif current_unit.departament_admin?
      departament_admin_role
    elsif current_unit.departament_moderator?
      departament_moderator_role
    elsif current_unit.units_admin?
      units_admin_role
    else
     redirect_to organization_departament_units_path(organization, departament)
    end
  end

  def show
    if current_unit.global_admin?
      global_admin_role
    elsif current_unit.global_moderator?
      global_moderator_role
    elsif current_unit.organization_admin?
      organization_admin_role
    elsif current_unit.organization_moderator?
      organization_moderator_role
    elsif current_unit.departament_admin?
      departament_admin_role
    elsif current_unit.departament_moderator?
      departament_moderator_role
    elsif current_unit.units_admin?
      units_admin_role
    else
      redirect_to organization_departament_unit_path(organization, departament, unit)
    end
  end

  def new
    if units.empty? 
        new_unit
    elsif current_unit.global_admin?
      global_admin_role
      new_unit
    elsif current_unit.global_moderator?
      global_moderator_role
      new_unit
    elsif current_unit.organization_admin?
      organization_admin_role
      new_unit
     elsif current_unit.departament_admin?
      departament_admin_role
      new_unit
    else
      redirect_to organization_departament_units_path(organization, departament)
    end
  end

  def create
    if units.empty?
      create_unit
    elsif current_unit.global_admin?
      global_admin_role
      create_unit
    elsif current_unit.global_moderator?
      global_moderator_role
      create_unit
    elsif current_unit.organization_admin?
      organization_admin_role
      create_unit
     elsif current_unit.departament_admin?
      departament_admin_role
      create_unit
    else
      redirect_to organization_departament_units_path(organization, departament, unit)
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
    elsif current_unit.departament_admin?
      departament_admin_role
    elsif current_unit.departament_moderator?
      departament_moderator_role
    elsif current_unit.units_admin?
      units_admin_role
    else
      redirect_to organization_departament_units_path(organization, departament, unit)
    end
  end

  def update
    def updation_unit
      if unit.update(unit_params)
        redirect_to organization_departament_units_path(organization, departament.id)
      end
    end
    if current_unit.global_admin?
      global_admin_role
      updation_unit
    elsif current_unit.global_moderator?
      global_moderator_role
      updation_unit
    elsif current_unit.organization_admin?
      organization_admin_role
      updation_unit
    elsif current_unit.organization_moderator?
      organization_moderator_role
      updation_unit
    elsif current_unit.departament_admin?
      departament_admin_role
      updation_unit
    elsif current_unit.departament_moderator?
      departament_moderator_role
      updation_unit
    elsif current_unit.units_admin?
      units_admin_role
      updation_unit
    else
        redirect_to organization_departament_units_path(organization, departament, unit)
    end
  end

  def destroy
    def deletion_unit
      if unit.destroy
        redirect_to organization_departament_units_path(organization, departament.id)
      end
    end
    if current_unit.global_admin?
      global_admin_role
      deletion_unit
    elsif current_unit.global_moderator?
      global_moderator_role
      deletion_unit
    elsif current_unit.organization_admin?
      organization_admin_role
      deletion_unit
    elsif current_unit.departament_admin?
      departament_admin_role
      deletion_unit
    else
      redirect_to organization_departament_units_path(organization, departament)
    end
  end

  def new_password
  end

  private
  def unit_params
    params.require(:unit).permit(:full_name, :belong_to_departament, :post, :email, :password, :password_confirmation, :secondary_email, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :login, :password, :characteristic, :show_hide_for_units, :show_hide_for_visitors, :global_admin, :global_moderator, :organization_admin, :organization_moderator, :departament_admin, :departament_moderator, :units_admin, :unitphoto)
  end

  def units
    @units ||= departament.units
  end
  helper_method :units

  def unit
    @unit ||= departament.units.find(params[:id])
  end
  helper_method :unit

  def new_unit
    @unit = Unit.new
  end

  def create_unit
    @unit = Unit.new(unit_params)
    @unit.organization = organization
    @unit.departament = departament
    if @unit.save and unit_signed_in?
      redirect_to organization_departament_units_path(organization, departament.id)
    else
      redirect_to new_unit_session_path()
    end
  end
end