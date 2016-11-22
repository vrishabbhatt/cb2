class HomeController < ApplicationController
  def home
  	if employer_signed_in?
  		@employer = current_employer
  	else
  		@employer = nil
  	end
  	puts @employer
  	puts "================"
  	puts session[:employer_id]
  end
end
