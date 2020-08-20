class NotificationsController < ApplicationController
  include SchedulesHelper

  def index
    @notifications = find_notifications.page(params[:page]).per Settings.pagination.page
  end

  def destroy
    notification = Notification.find_by id: params[:id]
    return if notification.status == Settings.notifications.readed

    notification.update status: Settings.notifications.readed
    @notifications = find_notifications
  end
end
