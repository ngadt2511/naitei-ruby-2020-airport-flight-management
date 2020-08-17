class RenameCodeToStaffCode < ActiveRecord::Migration[6.0]
  def change
  	rename_column :users, :code, :staff_code
  end
end
