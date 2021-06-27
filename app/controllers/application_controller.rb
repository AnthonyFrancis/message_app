class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery
	before_action :configure_permitted_parameters, if: :devise_controller?

	def current_user
	    super || guest_user
	end

	def user_signed_in?
	   return !current_user.guest
	end

	private

	def guest_user(with_retry = true)
	# Cache the value the first time it's gotten.
	# session[:guest_user_id] = nil
	@cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

	rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
	 session[:guest_user_id] = nil
	 guest_user if with_retry
	end

	def create_guest_user(guest_name = "guest")
	    user = User.new { |user| user.guest = true }
	    user.email = "guest_#{Time.now.to_i}#{rand(99)}@example.com"
	    user.full_name = guest_name
	    user.save(:validate => false)
	    user
	end

	protected


	def configure_permitted_parameters
		added_attrs = [:username, :name, :bio, :user_avatar] # this can grow to however many fields you need
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email, :username, :first_name, :last_name]
	end
end
