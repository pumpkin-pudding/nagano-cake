class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(resource)
    case resource
    when Admin
        admin_path
    when Customer
        root_path
    end 
  end 
  
  def after_sign_out_path_for(resource)
    case resource
    when Admin
        new_admin_session_path
    when Customer
        root_path
    end 
  end 
        
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :encrypted_password])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :phone_number, :zip_code, :address, :first_name_kana, :last_name_kana, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:email, :phone_number, :zip_code, :address, :first_name_kana, :last_name_kana, :first_name, :last_name])
  end 

end

