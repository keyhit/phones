class SearchesController < ApplicationController

  def index
    @branches_search ||=Branch.search_branch(params[:search])
    @organizations_search ||= Organization.search_organization(params[:search])
    @departaments_search ||= Departament.search_departament(params[:search])
    @public_units_organization_search = Unit.search_public_organization_units(params[:search])
    @public_units_departament_search = Unit.search_public_departament_units(params[:search])
    if role_1 || role_2
      @units_search = Unit.global_search_unit(params[:search])
    end
    if current_unit != role_1 || current_unit != role_2
      @colegues_search = Unit.search_colegues(params[:search], current_unit.organization_id)
    end
    @infos_search ||=Info.search_info(params[:search])
  end

  def new; end
end
