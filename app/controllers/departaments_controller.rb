class DepartamentsController < ApplicationController
  before_action :authenticate_unit!
  before_action :check_rules_global_admin, except: %i[index show new create first_departament edit update set_public_unit_id unset_public_unit_id destroy]
  before_action :check_rules_global_moderator, except: %i[index show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_organization_admin, except: %i[index show new create first_departament edit update set_public_unit_id unset_public_unit_id destroy]
  before_action :check_rules_organization_moderator, except: %i[index show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_departament_admin, except: %i[index show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_departament_moderator, except: %i[index show edit update set_public_unit_id unset_public_unit_id]
  before_action :check_rules_user, except: %i[index show]
  before_action :organizations_isolation

  def index; end

  def show; end

  def new; end

  def create
    @new_departament = Departament.new(departament_params)
    if @new_departament.save
      flash[:notice] = 'Departament saved!'
      redirect_to branch_organization_departaments_path(branch, organization)
    else
      flash[:error] = 'Departament was not saved!'
      redirect_to branch_organization_departaments_path(branch, organization)
    end
  end

  def first_departament
    @first_departament = Departament.new(departament_params)
    if @first_departament.save
      flash[:success] = 'First departament saved!'
      @unit_for_departament_create = Unit.find(current_unit.id)
      @unit_for_departament_create.update(departament_id: @first_departament.id)
      @departament_for_update = Departament.find(@first_departament.id)
      @departament_for_update.update(branch_id: current_unit.branch_id, organization_id: current_unit.organization_id)
      redirect_to branch_organization_path(branch, organization)
    else
      flash[:error] = 'First departament was not saved!'
    end
  end

  def edit; end

  def update
    if departament.update(departament_params)
      flash[:notice] = 'Departament updated!'
      redirect_to branch_organization_departaments_path(branch, organization)
    else
      flash[:error] = 'Departament was not updated!'
      redirect_to branch_organization_departaments_path(branch, organization)
    end
  end

  def set_public_unit_id
    if departament.update(set_unset_public_unit_id_params) && Unit.set_public_for_departament(params[:departament][:departament_id], params[:departament][:public_unit_id])
      flash[:notice] = "Unit id assigned for departament! Set public for departament!"
    else
      flash[:error] = "Unit id NOT assigned for departament! ERROR setting public for departament"
    end
    redirect_back fallback_location: root_path
  end
  
  def unset_public_unit_id
    if departament.update(set_unset_public_unit_id_params) && Unit.unset_public_for_departament(params[:departament][:departament_id])
      flash[:notice] = "Unit id UNassigned for departament! UNSet public for departament!"
    else
      flash[:error] = "Unit id STILL assigned for departament! ERROR setting public for departament"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    if departament.destroy
      flash[:notice] = 'Departament has been destroyed!'
      redirect_to branch_organization_departaments_path(branch, organization)
    else
      flash[:error] = 'Departament was not destroyed!'
      redirect_to branch_organization_departaments_path(branch, organization)
    end
  end

  private

  def departament_params
    params.require(:departament).permit(:departament_name, :subordinated, :public_unit_id,:departament_description, :departamentlogotype, :branch_id, :organization_id)
  end

  def departaments
    @departaments ||= organization.departaments
  end
  helper_method :departaments

  def departament
    @departament ||= departaments.find(params[:id])
  end
  helper_method :departament

  def set_unset_public_unit_id_params
    params.require(:departament).permit(:public_unit_id)
  end

  def create_departament
    if !organization.departaments.ids[0]
      if departaments.create(departament_params)
        redirect_to new_organization_departament_unit_path(organization, organization.departaments.ids[0])
      end
    else
      if departaments.create(departament_params)
        redirect_to new_organization_departament_unit_path(organization, organization.departaments.ids[-1])
      end
    end
  end
end
