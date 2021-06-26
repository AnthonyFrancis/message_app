class AddUserRelationToInboxes < ActiveRecord::Migration[6.1]
  def change
    add_reference :inboxes, :user, foreign_key: true
  end
end
