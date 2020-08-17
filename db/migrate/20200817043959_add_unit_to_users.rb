class AddUnitToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unit, :string
  end
end
