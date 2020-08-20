class Notification < ApplicationRecord
  belongs_to :schedule

  scope :find_notification_by_schedules, ->(user_ids){where schedule_id: Schedule.user_schedules(user_ids)}
end
