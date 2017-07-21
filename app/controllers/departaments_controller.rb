class DepartamentsController < ApplicationController
  before_action :authenticate_unit!
  before_action :check_rules_global_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_global_moderator, except: [ :index, :show, :edit, :update]
  before_action :check_rules_organization_admin, except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_organization_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_departament_admin , except: [ :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :check_rules_departament_moderator , except: [ :index, :show, :edit, :update]
  before_action :check_rules_user, except: [:index, :show]
  before_action :organizations_isolation

  def index
  end

  def show
  end

  def new
  end

  def create
      # if departaments.empty?
      #   create_departament
      # elsif current_unit.global_admin?
      #   global_admin_role
      #   create_departament
      # elsif current_unit.global_moderator?
      #   global_moderator_role
      #   create_departament
      # elsif current_unit.organization_admin?
      #   organization_admin_role
      #   create_departament
      # elsif current_unit.departament_admin?
      #   departament_admin_role
      #   create_departament
      # else
      #   redirect_to organization_path(params[:organization_id])
      # end
  end

  def edit
    # if current_unit.global_admin?
    #   global_admin_role
    # elsif current_unit.global_moderator?
    #   global_moderator_role
    # elsif current_unit.organization_admin?
    #   organization_admin_role
    # elsif current_unit.organization_moderator?
    #   organization_moderator_role
    # elsif current_unit.departament_admin?
    #   departament_admin_role
    # elsif current_unit.departament_moderator?
    #   departament_moderator_role
    # else
    #   redirect_to organization_departament_path(organization, departament)
    # end
  end

  def update
    # def updation_departament
    #   if departament.update(departament_params)
    #     redirect_to organization_departaments_path(organization)
    #   end
    # end
    # if current_unit.global_admin?
    #   global_admin_role
    #   updation_departament
    # elsif current_unit.global_moderator?
    #   global_moderator_role
    #   updation_departament
    # elsif current_unit.organization_admin?
    #   organization_admin_role
    #   updation_departament
    # elsif current_unit.organization_moderator?
    #   organization_moderator_role
    #   updation_departament
    # elsif current_unit.departament_admin?
    #   departament_admin_role
    #   updation_departament
    # elsif current_unit.departament_moderator?
    #   departament_moderator_role
    #   updation_departament
    # else
    #   redirect_to organization_departament_path(organization, departament)
    # end
end

  def destroy
    # def deletion_departament
    #   if departament.destroy
    #     redirect_to organization_departaments_path(organization)
    #   end
    # end
    # if current_unit.global_admin?
    #   global_admin_role
    #   deletion_departament
    # elsif current_unit.global_moderator?
    #   global_moderator_role
    #   deletion_departament
    # elsif current_unit.organization_admin?
    #   organization_admin_role
    #   deletion_departament
    # elsif current_unit.departament_admin?
    #   departament_admin_role
    #   deletion_departament
    # else
    #   redirect_to organization_departaments_path(organization)
    # end
  end

  private 
    def departament_params
      params.require(:departament).permit(:departament_name, :departament_description, :departamentlogotype)
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
