class Employer < ActiveRecord::Base
	validates :email, uniqueness: true
	has_one :eauth
	attr_accessor :validation_string
end
