class RemoveUserFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_reference :notifications, :user, null: false, foreign_key: true
  end
end
