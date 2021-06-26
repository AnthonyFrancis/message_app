class AddUserRelationToConversations < ActiveRecord::Migration[6.1]
  def change
    add_reference :conversations, :user, foreign_key: true
  end
end
