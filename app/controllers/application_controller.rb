class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_employer
  	employer = Employer.find(session[:employer_id])
  	employer
  end

  def employer_signed_in?
  	if session[:employer_id]!= nil
  		return true
  	else
  		return false
  end
end
