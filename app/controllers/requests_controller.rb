class RequestsController < ApplicationController
  include RequestAction

  def new
    @schedule = current_user.schedules[0]
    @schedule_request = Request.new
  end

  def create
    @request = Request.new request_params

    if @request.save
      send_notification_create

      flash[:success] = t ".create_request_success"
      redirect_to requests_path
    else
      flash[:danger] = t ".create_request_fail"
      render :new
    end
  end

  def index
    @requests = if current_user.admin?
                  Request.all.page(params[:page]).per Settings.pagination.page
                else
                  list_requests.lastest_time.page(params[:page]).per Settings.pagination.page
                end
  end

  def update
    if params[:status_req].present?
      handle_request params[:status_req]
    else
      flash[:danger] = t ".cancel_failed"
      redirect_to root_path
    end
  end

  private

  def request_params
    params.require(:request).permit Request::REQUEST_PARAMS
  end
end
