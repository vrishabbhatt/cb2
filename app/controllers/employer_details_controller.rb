class EmployerDetailsController < ApplicationController
	before_action :authorize_employer , :current_viewing_employer
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
		if 	@employer.save
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def send_verification
		find_employer
		unless @employer.mail_sent && @employer.is_verified 
		#call mailer to send mail
			create_and_send_eauth
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
		end

		def create_and_send_eauth
			eauth = Eauth.find_by(employer_id: @employer.id)||Eauth.new(employer_id: @employer.id)
			eauth.auth_code = SecureRandom.base64
			eauth.save
			EmployerMailer.verification_mail(@employer).deliver_later
		end

		def current_viewing_employer
			if current_employer != find_employer
				redirect_to root_path
			end
		end
end
