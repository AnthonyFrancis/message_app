class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected


	def configure_permitted_parameters
		added_attrs = [:username, :name, :bio, :profile_image] # this can grow to however many fields you need
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email, :username, :first_name, :last_name]
	end
end
