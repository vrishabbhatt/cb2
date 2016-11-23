class VerificationController < ApplicationController
	before_action :authorize_employer

	def employ_verification
		@employer = current_employer
	end

	def verify_employ
		@employer = current_employer
		if @employer.eauth.auth_code == params[:employer][:validation_string]
			@employer.is_verified = true
			@employer.save
			redirect_to root_path
		else
			render 'verificaticon/employ_verification'
		end
	end
end
