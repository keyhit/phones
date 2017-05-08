class DepartamentsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
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

  def edit
  end

  def update
    if departament.update(departament_params)
      redirect_to organization_departaments_path(organization)
    end
  end

  def destroy
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

end
