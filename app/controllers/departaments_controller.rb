class DepartamentsController < ApplicationController
  before_action :authenticate_unit!, except: [:new, :create]

  def index
    # if current_unit.role == 'global_admin' || current_unit.role == 'global_moderator'
    #   global_admin_role
    # else
    #   redirect_to branch_organization_path(params[:branch_id], params[:organization_id])
    # end
  end

  def show
    # if current_unit.role == global_admin_role || current_unit.role == global_moderator_role
    #   global_admin_role
    # else
    #   redirect_to branch_organization_path(branches, organization)
    # end
  end

  def new
    # if  departaments.empty?
    # else
    #   if current_unit.global_admin?
    #     global_admin_role
    #   elsif current_unit.global_moderator?
    #     global_moderator_role
    #   elsif current_unit.organization_admin?
    #     organization_admin_role
    #   elsif current_unit.departament_admin?
    #     departament_admin_role
    #   else
    #     redirect_to organization_departaments_path(organization)
    #   end
    # end
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
