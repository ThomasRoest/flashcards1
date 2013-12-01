class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if cookies[:user_id]
  		user_id = cookies.signed[:user_id]
  		@current_user = User.find_by_id(user_id)
  	end
  end
  helper_method :current_user

  def sign_in user
  	cookies.signed[:user_id] = user.id 
  end

  def authenticate
  	if !signed_in?
  	redirect_to new_session_path
   end
  end

  def signed_in?
  	current_user  #nils or #<User>
  end
  helper_method :signed_in?
end
