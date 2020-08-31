module SchedulesHelper
  def handle_notification
    if current_user.air_traffic_officer?
      return Notification.find_notification_by_air_traffic.select do |notification|
        notification.status == Settings.notifications.no_read
      end
    end

    find_notifications.select do |notification|
      notification.status == Settings.notifications.no_read
    end
  end

  def find_notifications
    return Notification.find_notification_by_schedules(current_user.id).order created_at: :desc if current_user.pilot?

    find_notification_by_air_traffic.lastest_time if current_user.air_traffic_officer?
  end

  def find_notification_by_air_traffic
    Notification.find_notification_by_air_traffic
  end
end
