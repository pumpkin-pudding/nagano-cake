class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  
  private
  def admin_url
    request.fullpath.starts_with?('/admin')
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end

