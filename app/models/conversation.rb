class Conversation < ApplicationRecord
  belongs_to :inbox
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates :messages, presence: true

  accepts_nested_attributes_for :messages, :reject_if => lambda { |a| a[:body].blank? }, :allow_destroy => true
  
end
