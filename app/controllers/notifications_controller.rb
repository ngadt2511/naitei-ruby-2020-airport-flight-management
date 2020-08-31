class NotificationsController < ApplicationController
  include SchedulesHelper

  def index
    if current_user.air_traffic_officer?
      @notifications = find_notification_by_air_traffic.page(params[:page]).per Settings.pagination.page
    end

    @notifications = find_notifications.page(params[:page]).per Settings.pagination.page if current_user.pilot?
  end

  def destroy
    notification = Notification.find_by id: params[:id]
    return if notification.status == Settings.notifications.readed

    notification.update status: Settings.notifications.readed
    @notifications = find_notifications
  end
end
