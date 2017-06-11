class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def organization
      @organization ||= Organization.find(params[:organization_id])
    end
    helper_method :organization

    def departament
      @departament ||= organization.departaments.find(params[:departament_id])
    end
    helper_method :departament

    def departaments
      @departaments ||= organization.departaments.where(params[:organization_id])
    end
    helper_method :departaments

    def units
      @units ||=departament.units.where(params[:departament_id])
    end
    helper_method :units

    # By default signed unit can't visit to departaments and units lists
    # outher company 
    def organizations_isolation
      if unit_signed_in?
        if current_unit.organization_id.to_s != params[:organization_id] 
          redirect_to organization_path(params[:organization_id])
        end
      end
    end

    def admin_moderator_roles
      if  current_unit.global_admin == true || current_unit.global_moderator == true
      else
        organizations_isolation
      end
    end

    protected
      def configure_permitted_parameters
        attributes = [:full_name, :belong_to_departament, :post, :email, :password, :password_confirmation, :secondary_email, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :login, :password, :characteristic, :show_hide_for_units, :show_hide_for_visitors, :global_admin, :global_moderator, :organization_admin, :organization_moderator, :departament_admin, :units_admin, :unitphoto]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
      end
end
