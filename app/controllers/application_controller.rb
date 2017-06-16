class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def organization
      @organization ||= Organization.find(params[:organization_id])
    end
    helper_method :organization

    def unit_orgammization
      @unit_orgammization ||= Organization.find(current_unit.organization_id)
    end
    helper_method :unit_orgammization

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

    def public_presentation
      if organization.public_presentation_user_id? 
        @public_presentation ||= Unit.find(organization.public_presentation_user_id)
      end
    end
    helper_method :public_presentation

    # By default signed unit can't visit to departaments and units lists
    # outher company 
    def organizations_isolation
      if unit_signed_in?
        if current_unit.organization_id != organization.id
           redirect_to organization_path(organization)
        end
      end
    end

    # Here roles of units
    def global_admin_role
    end

    def global_moderator_role
    end

    def organization_admin_role
        organizations_isolation
    end

    def organization_moderator_role
        organizations_isolation
    end

    def departament_admin_role
        organizations_isolation
    end

    def departament_moderator_role
        organizations_isolation
    end

    def units_admin_role
        organizations_isolation
    end
    
    protected
      def configure_permitted_parameters
        attributes = [:full_name, :belong_to_departament, :post, :email, :password, :password_confirmation, :secondary_email, :primary_phone_number, :secondary_phone_number, :short_phone_nunber, :fax, :home_phone_number, :web_page, :start_work, :finish_work, :working_days, :birthday, :login, :password, :characteristic, :show_hide_for_units, :show_hide_for_visitors, :global_admin, :global_moderator, :organization_admin, :organization_moderator, :departament_admin, :departament_moderator, :units_admin, :unitphoto]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
      end
end
