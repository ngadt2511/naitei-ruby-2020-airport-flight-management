class ChangeTypeColumnsToBeDatetimeInSchedules < ActiveRecord::Migration[6.0]
  def up
    change_column :schedules, :time, :datetime
  end

  def down
    change_column :schedules, :time, :date
  end
end
