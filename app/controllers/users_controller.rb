class UsersController < ApplicationController
	def show
		@user = User.friendly.find(params[:id])
		@conversation = current_user.conversations.build
		@conversations = current_user.conversations.all.order("created_at ASC")
	end
end