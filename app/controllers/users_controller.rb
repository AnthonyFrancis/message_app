class UsersController < ApplicationController
	def show
		@user = User.friendly.find(params[:id])
	    # @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
		@conversation = current_user.conversations.build

		@conversations = current_user.conversations.all.order("created_at ASC")
		#@conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
    	@users = User.where.not(id: current_user.id)
	end
end