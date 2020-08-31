class Notification < ApplicationRecord
  belongs_to :schedule

  scope :find_notification_by_schedules, (lambda do |user_ids|
    where schedule_id: Schedule.user_schedules(user_ids), type_account: Settings.type_account.pilot
  end)
  scope :find_notification_by_air_traffic, ->{where type_account: Settings.type_account.air_traffic}
  scope :lastest_time, ->{order created_at: :desc}
end
