class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    # render :template => 'application/index', :layout => 'application'
  end

  def authorize_user!
    if !current_user.employee.management?
      redirect_to issues_path, :alert => "Sorry, you are not authorized to view that page."
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      
      u.permit({ :employee_attributes => [:name] }, :email, :password, :password_confirmation) 
    }
  end
end
