class EmployersController < ApplicationController
	def new
		@employer = Employer.new
	end

	def sign_in
		@employer = Employer.new
	end
	
	def edit
	end
end
