class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def organization
      @organization ||= Organization.find(params[:organization_id])
    end

    helper_method :organization

    def departament
      @departament ||= organization.departaments.find(params[:departament_id])
    end

    helper_method :departament

end
