class DepartamentsController < ApplicationController
  before_action :authenticate_unit!
  before_action :check_rules_global_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_global_moderator, except: [ :index, :show, :edit, :update]
  before_action :check_rules_organization_admin, except: [ :index, :show, :new, :create, :first_departament, :edit, :update, :destroy]
  before_action :check_rules_organization_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_departament_admin , except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_departament_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_user, except: [:index, :show]
  before_action :organizations_isolation, if: [ :role_3, :role_4, :role_5, :role_6, :role_7 ]
  before_action :check_rules_user_when_registering, except: [:first_departament]
  before_action :organizations_isolation

  def index
  end

  def show
  end

  def new
  end

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
      flash[:notice] = 'First departament saved!'
      @unit_for_departament_create = Unit.find(current_unit.id)
      @unit_for_departament_create.update({belong_to_departament: @first_departament.departament_name, departament_id: @first_departament.id})
      @departament_for_update = Departament.find(@first_departament.id)
      @departament_for_update.update({branch_id: current_unit.branch_id, organization_id: current_unit.organization_id })
      redirect_to branch_organization_path(branch, organization)
    else
      flash[:error] = 'First departament was not saved!'
    end
  end

  def edit
  end

  def update
    def updation_departament
      if departament.update(departament_params)
        redirect_to branch_organization_departaments_path(branch, organization)
      end
    end
end

  def destroy
    if departament.destroy
      redirect_to branch_organization_departaments_path(branch, organization)
    end
  end

  private 
    def departament_params
      params.require(:departament).permit(:departament_name, :departament_description, :departamentlogotype, :branch_id, :organization_id)
    end

    def departaments
      @departaments ||= organization.departaments
    end
    helper_method :departaments

    def departament
      @departament ||= departaments.find(params[:id])
    end
    helper_method :departament

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
