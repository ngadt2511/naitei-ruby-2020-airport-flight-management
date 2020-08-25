class RequestsController < ApplicationController
  def new
    @schedule = current_user.schedules[0]
    @schedule_request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t ".create_request_success"
      redirect_to new_request_path
    else
      flash[:danger] = t ".create_request_fail"
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit Request::REQUEST_PARAMS
  end
end
