class AddTypeAccountToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :type_account, :integer
  end
end
