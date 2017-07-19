class BranchesController < ApplicationController
    before_action :check_rules, :authenticate_unit!, except: [:index]

  def index
  end

  def admin_branches
  end

  def show
  end

  def new
  end

  def create
    @new_branch = Branche.new(branche_params)
    @new_branch.valid?
    @new_branch.errors[:branch_name]
    @new_branch.branch_name.upcase!
    if @new_branch.save
      redirect_to admin_branches_path()
    else
      flash[:error] = @new_branch.errors[:branch_name]
      redirect_to new_branch_path(@new_branch.branch_name)
    end
  end

  def edit
  end

  def update
    if branch_edit.update(branche_params)
      redirect_to admin_branches_path()
    else
      flash[:error] = 'No saved!'
      redirect_to edit_branch_path()
    end
  end

  def destroy
    if Branche.destroy(params[:id])
      redirect_to admin_branches_path()
    end
  end

  private
  def branche_params
    params.require(:branche).permit(:branch_name)
  end

  def branch_edit
    @branche_edit ||= Branche.find(params[:id])
  end
  helper_method :branch_edit

end
