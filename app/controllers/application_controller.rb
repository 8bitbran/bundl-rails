class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    private 

    def require_login
        unless user_signed_in?
            flash[:danger] = "You must be logged in to access this section"
            redirect_to root_path
        end
    end
end
