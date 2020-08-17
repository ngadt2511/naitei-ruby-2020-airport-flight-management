class CreatePlanes < ActiveRecord::Migration[6.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.string :status
      t.string :braned

      t.timestamps
    end
  end
end
