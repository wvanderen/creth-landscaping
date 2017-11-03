class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  private 
  def require_sign_in
    unless user_signed_in?
      flash[:alert] = "You must be logged in to do that"
    end
  end
end
