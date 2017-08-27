class BranchesController < ApplicationController
  before_action :authenticate_unit!, except: %i[index select_branch]
  before_action :check_rules_global_admin, except: %i[index admin_branches show new create edit update destroy]
  before_action :check_rules_global_moderator, except: %i[index admin_branches show edit update]
  before_action :check_rules_organization_admin, except: [:index]
  before_action :check_rules_organization_moderator, except: [:index]
  before_action :check_rules_departament_admin, except: [:index]
  before_action :check_rules_departament_moderator, except: [:index]
  before_action :check_rules_user, except: [:index]
  def index; end

  def show; end

  def new; end

  def create
    @new_branch = Branch.new(branche_params)
    @new_branch.valid?
    @new_branch.errors[:branch_name]
    @new_branch.branch_name.upcase!
    if @new_branch.save!
      redirect_to admin_branches_path
    else
      flash[:error] = @new_branch.errors[:branch_name]
      redirect_to new_branch_path(@new_branch.branch_name)
    end
  end

  def edit; end

  def update
    if branch_edit.update(branche_params)
      redirect_to admin_branches_path
    else
      flash[:error] = 'No saved!'
      redirect_to edit_branch_path
    end
  end

  def destroy
    if Branch.destroy(params[:id])
      redirect_to admin_branches_path()
      flash[:notice] = 'Branch was deleted!'
    else
      redirect_to admin_branches_path()
      flash[:error] = 'Branch was not deleted!'
    end
  end

  def admin_branches; end

  def select_branch; end

  private

  def branche_params
    params.require(:branch).permit(:branch_name)
  end

  def branch_edit
    @branche_edit ||= Branch.find(params[:id])
  end
  helper_method :branch_edit
end
