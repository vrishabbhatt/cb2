class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  helper_method :employer_signed_in? , :employer_id , :employer_is_verified? , :current_employer
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
  def employer_id
    if employer_signed_in?
      return session[:employer_id]
    end
    nil
  end
  def employer_is_verified?
    employer = current_employer

    employer.is_verified
  end

  def authorize_employer
    unless employer_signed_in?
      redirect_to root_path
     end
  end
end
