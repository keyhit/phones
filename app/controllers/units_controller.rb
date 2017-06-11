class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: [:new, :create]

  def index
    admin_moderator_roles
  end

  def show
    admin_moderator_roles
  end

  def new
    if units.empty?
      new_unit
    else
      admin_moderator_roles
      new_unit
    end

  end

  def create
    if units.empty?
      create_unit
    else
      admin_moderator_roles
      create_unit
    end
  end

  def edit
    admin_moderator_roles
  end

  def update
    admin_moderator_roles
    if unit.update(unit_params)
      redirect_to organization_departament_units_path(organization, departament.id)
    end
  end

  def destroy
    admin_moderator_roles
    if unit.destroy
      redirect_to organization_departament_units_path(organization, departament.id)
    end
  end

  private
  def unit_params
    params.require(:unit).permit(:full_name, :belong_to_departament, :post, :email, :password, :password_confirmation, :secondary_email, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :login, :password, :characteristic, :show_hide_for_units, :show_hide_for_visitors, :global_admin, :global_moderator, :organization_admin, :organization_moderator, :departament_admin, :units_admin, :unitphoto)
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