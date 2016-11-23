class EmployerMailer < ApplicationMailer
	def verification_mail employer
		@employer = employer
		puts "============================="
		puts employer.email
		puts @employer.name
		# @body[:employer] = @employer
		# @body[:verification_code] = employer.eauth.auth_code
		@verification_code = @employer.eauth.auth_code
		puts "=========================================="
		puts @verification_code
		mail(to: @employer.email, subject: 'Verification code')
	end
end
