class AddScheduleToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :schedule, null: false, foreign_key: true
  end
end
