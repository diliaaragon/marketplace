# frozen_string_literal: true

# Application Controller.
class ApplicationController < ActionController::Base
  before_action :configure_devise_params, if: :devise_controller?
 def configure_devise_params
   devise_parameter_sanitizer.permit(:sign_up) do |user|
     user.permit(:email,
                 :photo,
                 :password,
                 :password_confirmation,
                 :first_name,
                 :last_name,
                 :cellphone,
                 :address)
   end
   devise_parameter_sanitizer.permit(:account_update) do |user|
     user.permit(:email,
                 :photo,
                 :password,
                 :password_confirmation,
                 :current_password,
                 :first_name,
                 :last_name,
                 :cellphone,
                 :address)
   end
 end
end
