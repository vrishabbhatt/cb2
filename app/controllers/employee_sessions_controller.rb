class EmployeeSessionsController < ApplicationController
  def sign_up
  	@employer = Employer.new(employer_params)
  	sign_through
  	redirect_to root_path
  end

  def sign_in
  	@employer = Employer.find_by(email: params[:employer][:email])
  	if @employer.ph_no != params[:employer][:ph_no]
  		#redirect or render error path
  	end
  	sign_through
  	redirect_to root_path
  end

  def log_out
  	
  end

  private

  def employer_params
  	params.require(:employer).permit(:email , :ph_no)
  end

  def sign_through
  	session.clear
  	session.new
  	session[:employer_id] = @employer.id
  end
end
