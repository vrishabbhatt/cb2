class EmployerMailer < ApplicationMailer
	def verification_mail employer
		@employer = employer
		@verification_code = @employer.eauth.auth_code
		mail(to: @employer.email, subject: 'Verification code')
	end
end
