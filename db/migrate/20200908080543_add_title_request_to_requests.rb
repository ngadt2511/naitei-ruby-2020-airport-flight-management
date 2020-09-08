class AddTitleRequestToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :title_request, :string
  end
end
