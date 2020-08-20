module SchedulesHelper
  def handle_notification
    @no_read_notification = find_notifications.select do |notification|
      notification.status == Settings.notifications.no_read
    end
  end

  def find_notifications
    Notification.find_notification_by_schedules current_user.id
  end
end
