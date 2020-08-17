class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :time
      t.string :status
      t.string :title
      t.string :from
      t.string :to
      t.references :runway, null: false, foreign_key: true
      t.references :plane, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
