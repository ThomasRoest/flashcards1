class SessionsController < ApplicationController
	# the sessionscontroller has no model association.
	def new  
	end

	def create
		user = User.find_by_email(params[:session][:email])
		#find by rails method for db columns
		sign_in(user)
		#.signed encrypts the cookies and creates a hash
		# check document.cookie in the javascript console
		redirect_to decks_path
	end

	def destroy
		cookies.delete(:user_id)
		#delete the cookie to sign out/delete the session
		redirect_to root_path 
		#create a root path/homes_controller for logged out users
	end
end