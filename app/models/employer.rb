class Employer < ActiveRecord::Base
	validates :email, uniqueness: true ,email_format: { message: "email address isnt valid" }
	validates :ph_no, presence: true , :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
	# validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	has_one :eauth
	attr_accessor :validation_string
end
