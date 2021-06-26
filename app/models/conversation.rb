class Conversation < ApplicationRecord
	has_many :users
	# has_many :messages, dependent: :destroy

	# belongs_to :sender, class_name: "User", foreign_key: "sender_id"
 #  	belongs_to :receiver, class_name: "User", foreign_key: "recipient_id"
	

	# validates_uniqueness_of :sender_id, :scope => :recipient_id

	# scope :between, -> (sender_id,recipient_id) do
 #    	where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.recipient_id = ? AND conversations.sender_id = ?)", sender_id, recipient_id, sender_id, recipient_id)
 #  	end

end
