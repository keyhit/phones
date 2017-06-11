class DepartamentsController < ApplicationController
  before_action :authenticate_unit!, except: [:new, :create]

  def index
    admin_moderator_roles
  end

  def show
    admin_moderator_roles
  end

  def new
    if  departaments.empty?
    else
      admin_moderator_roles
    end
  end

  def create
    if departaments.empty?
      create_departament
    else
      organizations_isolation
      create_departament
    end
  end

  def edit
    admin_moderator_roles
  end

  def update
    admin_moderator_roles
    if departament.update(departament_params)
      redirect_to organization_departaments_path(organization)
    end
  end

  def destroy
    admin_moderator_roles
    if departament.destroy
      redirect_to organization_departaments_path(organization)
    end
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
