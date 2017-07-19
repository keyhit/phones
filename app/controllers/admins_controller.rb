class AdminsController < ApplicationController
  def index
  end

  def show
    @params = params[:id]
    @object = eval(@params)
    @res = @object.all
    @col = @object.column_names


    @res.each do |r|
      r.id
    end

    def cols
      @col.each do |c|
        c
      end
    end
    helper_method :cols

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def all
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
