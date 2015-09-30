class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def require_login
    if !current_user
      redirect_to root_path #halt's request cycle
    end
  end

end
