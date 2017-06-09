class UnitsController < ApplicationController
  before_action :authenticate_unit!, except: []

  def index
  end

  def show
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.organization = organization
    @unit.departament = departament
    if @unit.save
      redirect_to organization_departament_units_path(organization, departament.id)
    end
  end

  def edit
  end

  def update
    if unit.update(unit_params)
      redirect_to organization_departament_units_path(organization, departament.id)
    end
  end

  def destroy
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
end