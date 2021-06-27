class Conversation < ApplicationRecord
  belongs_to :inbox
  belongs_to :user
  has_many :messages, dependent: :destroy
  
end
