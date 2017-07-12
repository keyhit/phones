class BranchesController < ApplicationController
    before_action :authenticate_unit!, except: [:show]
  def index
  end

  def admin
  end
  
  def new
  end

  def edit
  end

  def show
  end


  private
    def branch_organizations_admin(*args)
      @branch_organizations_admin = Organization.where(branche_id: args)
    end
    helper_method :branch_organizations_admin

    def branch_organization_departaments(*args)
      @branch_organization_departaments = Departament.where(organization_id: args)
    end
    helper_method :branch_organization_departaments

end
