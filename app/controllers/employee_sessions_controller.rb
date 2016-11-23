class EmployeeSessionsController < ApplicationController

  def sign_up
  	@employer = Employer.new(employer_params)
  	if @employer.save
	  	sign_through
	  	# redirect_to root_path
      redirect_to edit_employer_detail_path(@employer.id)
    else
      # redirect_to root_path
      render 'employers/new'
  	end
  end

  def sign_in
  	@employer = Employer.find_by(email: params[:employer][:email])
  	if @employer
	  	if @employer.ph_no != params[:employer][:ph_no]
	  		create_fake_employer
	  		render 'employers/sign_in', employer: @employer
	  	else
	  		sign_through
	  		redirect_to root_path
	  	end
	else
			create_fake_employer
	  		render template: 'employers/sign_in'
	end
  end

  def log_out
  	session.clear
  	redirect_to root_path
  end

  private

  def employer_params
  	params.require(:employer).permit(:email , :ph_no)
  end

  def sign_through
  	session[:employer_id] = @employer.id
  	session[:status] = "active"
  	puts session[:employer_id] 
  end

  def create_fake_employer
  	@employer = Employer.new
  	@employer.email = params[:employer][:email]
  	@employer.ph_no = params[:employer][:ph_no]
  	@employer
  end
end
