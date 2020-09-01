class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from Settings.channel.notifications
  end

  def unsubscribed; end
end
