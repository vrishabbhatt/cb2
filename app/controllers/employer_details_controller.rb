class EmployerDetailsController < ApplicationController
	def show
		find_employer
	end	

	def edit
		find_employer
		unless @employer
			render 'home/home'
		end
	end

	def update
		find_employer
		if @employer.ph_no != params[:employer][:ph_no]  || @employer.email != params[:employer][:email]
			@employer.is_verified = false
			@employer.mail_sent = false
			# @employer.update(employer_params , is_verified: false , mail_sent: false)
		# else
		# 	@employer.update(employer_params)
		end
		update_employer
		redirect_to root_path
	end

	def send_verification
		find_employer
		unless @employer.mail_sent && @employer.is_verified 
		#call mailer to send mail
			@employer.mail_sent = true
			@employer.save
			respond_to do |format|
				format.html{}
				format.js{}
			end
		else
			respond_to do |format|
				format.html{}
				format.js{render 'error.js.erb'}
			end
		end
	end

	private
		def find_employer
			@employer = Employer.find(params[:id])
		end

		def employer_params
			params.require(:employer).permit(:name , :email , :ph_no , :dob , :location)
		end

		def update_employer
			@employer.name = params[:employer][:name]
			@employer.email = params[:employer][:email]
			@employer.ph_no = params[:employer][:ph_no]
			@employer.dob = params[:employer][:dob]
			@employer.location = params[:employer][:location]
			@employer.save
		end
end
