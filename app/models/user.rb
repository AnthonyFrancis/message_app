class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :inbox, dependent: :destroy
  after_create :create_inbox

  def create_inbox
    if self.guest == false
      self.build_inbox.save(validate: false)
    end 
  end

  extend FriendlyId
  friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    username_changed?
  end
  
end
