class ChangeTypeColumnsToBeIntegerInUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :type_account, :integer
  end

  def down
    change_column :users, :type_account, :string
  end
end
