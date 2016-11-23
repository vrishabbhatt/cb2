class Employer < ActiveRecord::Base
	validates :email, uniqueness: true
	attr_accessor :validation_string
end
