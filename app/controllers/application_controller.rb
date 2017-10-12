class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = current_unit.locale.to_s || I18n.default_locale if current_unit.present?
  end

  private

  def branches
    @branches ||= Branch.all
  end
  helper_method :branches

  def branch
    @branch ||= Branch.find(params[:branch_id])
  end
  helper_method :branch

  def all_organizations
    @all_organizations ||= Organization.all
  end
  helper_method :all_organizations

  def branch_organizations
    @branch_organizations ||= Organization.where(branch_id: branch.id)
  end
  helper_method :branch_organizations

  def organization
    @organization ||= Organization.find(params[:organization_id])
  end
  helper_method :organization

  def unit_branch
    @unit_branch ||= Branch.find(current_unit.branch_id)
  end
  helper_method :unit_branch

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

  def organization_public_person
    @organization_public_person ||= Unit.find(organization.public_unit_id) if organization.public_unit_id?
  end
  helper_method :organization_public_person

  def departament_public_person
    @departament_public_person ||= Unit.find(departament.public_unit_id) if departament.public_unit_id?
  end
  helper_method :departament_public_person

  def departament_public_units_id(arg)
    @departament_public_units_id = Unit.find_by('id' => arg)
  end
  helper_method :departament_public_units_id

  def branch_organization_departament_units(*args)
    @branch_organization_departament_units = Unit.where(departament_id: args)
  end
  helper_method :branch_organization_departament_units

  # Here roles of units
  def role_1
    current_unit.role == 'global_admin' if unit_signed_in?
  end
  helper_method :role_1

  def check_rules_global_admin
    if role_1
      if role_1
        flash[:error] = 'No access for role_1!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_2
    current_unit.role == 'global_moderator' if unit_signed_in?
  end
  helper_method :role_2

  def check_rules_global_moderator
    if role_2
      if role_2
        flash[:error] = 'No access for role_2!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_3
    current_unit.role == 'organization_admin' if unit_signed_in?
  end
  helper_method :role_3

  def check_rules_organization_admin
    if role_3
      if role_3
        flash[:error] = 'No access for role_3!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_4
    current_unit.role == 'organization_moderator' if unit_signed_in?
  end
  helper_method :role_4

  def check_rules_organization_moderator
    if role_4
      if role_4
        flash[:error] = 'No access for role_4!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_5
    current_unit.role == 'departament_admin' if unit_signed_in?
  end
  helper_method :role_5

  def check_rules_departament_admin
    if role_5
      if role_5
        flash[:error] = 'No access for role_5!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_6
    current_unit.role == 'departament_moderator' if unit_signed_in?
  end
  helper_method :role_6

  def check_rules_departament_moderator
    if role_6
      if role_6
        flash[:error] = 'No access for role_6!'
        redirect_to branches_path
        nil
      else
        true
      end
    end
  end

  def role_7
    current_unit.role == 'user' if unit_signed_in?
  end
  helper_method :role_7

  def check_rules_user
    if role_7
      if role_7
        flash[:error] = 'No access for role_7!'
        redirect_to branches_path
      else
        true
      end
    end
  end

  # By default signed unit can't visit to departaments and units lists
  # outher company
  def organizations_isolation
    if role_1 == true
      flash[:alert] = 'You here as global administrator!'
    elsif role_2 == true
      flash[:alert] = 'You here as global moderator!'
    elsif role_1 == false || role_2 == false
      if current_unit.organization_id != organization.id
        flash[:error] = 'You not work here. Access denie !'
        redirect_to branch_organization_path(branch, organization)
      end
    end
  end

  protected

  def configure_permitted_parameters
    attributes = %i[name surename patronymic belong_to_departament post email secondary_email password password_confirmation primary_phone_number secondary_phone_number short_phone_nunber fax home_phone_number web_page start_work finish_work working_days birthday unitphoto characteristic role subordinate]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
