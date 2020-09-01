module RequestAction
  def list_requests
    return Request.find_request_by_user(current_user.id) if current_user.pilot?

    Request.find_request_pending unless current_user.pilot?
  end

  def handle_request status_req
    if current_request.update status_request: status_req.to_i
      if status_req == Settings.notifications.request.cancel_request
        send_notification_cancel status_req
      else
        send_notification_handle status_req
      end

      flash[:success] = t ".success"
      redirect_to requests_path
    else
      flash[:danger] = t ".cancel_failed"
      redirect_to root_path
    end
  end

  def current_request
    Request.find_by id: params[:id]
  end

  def find_user_from_request
    User.find_by id: current_request.schedule.user_id
  end

  def send_notification_cancel status_req
    ActionCable.server.broadcast Settings.channel.notifications,
                                 {from: current_user.name, to: "owner_notification_#{find_user_from_request.id}",
                                  message: t(".message"), request_id: current_request.id, status_req: status_req,
                                  owner_id: current_user.id}
  end

  def send_notification_handle status_req
    ActionCable.server.broadcast Settings.channel.notifications,
                                 {from: current_user.name, to: "owner_notification_#{find_user_from_request.id}",
                                  message: t(".message"), request_id: current_request.id, status_req: status_req}
  end

  def send_notification_create
    ActionCable.server.broadcast Settings.channel.notifications, {from: current_user.email,
                                                                  message: t(".message_to_air_traffic")}
  end
end
