require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # before_action :set_current_user
  skip_before_action :authenticate_user!, only: [:index, :show]

  self.responder = ApplicationResponder
  respond_to :html


  def set_current_user
    if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name ])
  end 
end 


