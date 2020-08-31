class AddStatusRequestAndOwnerToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :status_request, :integer, :default => 0
    add_column :requests, :owner, :integer
  end
end
