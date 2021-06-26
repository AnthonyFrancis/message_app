class AddUserRelationToInboxes < ActiveRecord::Migration[6.1]
  def change
    add_reference :inboxes, :user, null: false, foreign_key: true
  end
end
