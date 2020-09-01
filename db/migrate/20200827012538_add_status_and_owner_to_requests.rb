class AddStatusAndOwnerToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :status, :integer
    add_column :requests, :owner, :string
  end
end
