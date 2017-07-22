class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  private
    def branches
      @branches = Branche.all
    end
    helper_method :branches

    def branch
      @branch = Branche.find(params[:branch_id])
    end
    helper_method :branch

    def all_organizations
      @all_organizations = Organization.all
    end
    helper_method :all_organizations

    def branch_organizations
      @branch_organizations = Organization.where(branche_id: branch.id)
    end
    helper_method :branch_organizations

    def organization
      @organization ||= Organization.find(params[:organization_id])
    end
    helper_method :organization

    def unit_organization
      @unit_organization ||= Organization.find(current_unit.organization_id)
    end
    helper_method :unit_organization

    def departament
      @departament ||= organization.departaments.find(params[:departament_id])
    end
    helper_method :departament

    def departaments
      @departaments ||= organization.departaments.where(params[:organization_id])
    end
    helper_method :departaments

    def units
      @units ||= departament.units.where(params[:departament_id])
    end
    helper_method :units

    def public_presentation
      if organization.public_presentation_user_id? 
        @public_presentation ||= Unit.find(organization.public_presentation_user_id)
      end
    end
    helper_method :public_presentation

    def branch_organization_departament_units(*args)
      @branch_organization_departament_units = Unit.where(departament_id: args)
    end
    helper_method :branch_organization_departament_units



  # By default signed unit can't visit to departaments and units lists
  # outher company 
  def organizations_isolation
    if unit_signed_in?
      if current_unit.organization_id != organization.id
        flash[:error] = 'You not work here. Access denie !'
        redirect_to branch_organization_path(branch, organization)
      end
    end
  end
  
  # Here roles of units
  def role_1
    if unit_signed_in?
      current_unit.role == 'global_admin'
    end
  end
  helper_method :role_1

  def check_rules_global_admin
    if role_1
      unless role_1
        return true
      else
        flash[:error] = 'No access for role_1!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_2
    if unit_signed_in?
      current_unit.role == 'global_moderator'
    end
  end
  helper_method :role_2

  def check_rules_global_moderator
    if role_2
      unless role_2
        return true
      else
        flash[:error] = 'No access for role_2!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_3
    if unit_signed_in?
      current_unit.role == 'organization_admin' 
    end
  end
  helper_method :role_3

  def check_rules_organization_admin
    if role_3
      unless role_3
        return true
      else
        flash[:error] = 'No access for role_3!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_4
    if unit_signed_in?
      current_unit.role == 'organization_moderator'
    end
  end
  helper_method :role_4

  def check_rules_organization_moderator
    if role_4
      unless role_4
        return true
      else
        flash[:error] = 'No access for role_4!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_5
    if unit_signed_in?
      current_unit.role == 'departament_admin'
    end
  end
  helper_method :role_5

  def check_rules_departament_admin
    if role_5
      unless role_5
        return true
      else
        flash[:error] = 'No access for role_5!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_6
    if unit_signed_in?
      current_unit.role == 'departament_moderator'
    end
  end
  helper_method :role_6

  def check_rules_departament_moderator
    if role_6
      unless role_6
        return true
      else
        flash[:error] = 'No access for role_6!'
        redirect_to branches_path()
        return
      end
    end
  end

  def role_7
    if unit_signed_in?
      current_unit.role == 'user'
    end
  end
  helper_method :role_7

  def check_rules_user
    if role_7
      unless role_7
        return true
      else
        flash[:error] = 'No access for role_7!'
        redirect_to branches_path()
      end
    end
  end

    protected
      def configure_permitted_parameters
        attributes = [:full_name, :belong_to_departament, :post, :email, :secondary_email, :password, :password_confirmation, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :unitphoto, :characteristic, :role, :subordinate]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
      end
end
