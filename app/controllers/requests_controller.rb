class RequestsController < ApplicationController
  # before_action: :find_request, only: :update

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

  def index
    @requests = list_requests.page(params[:page]).per Settings.pagination.page
  end

  # def update
  #   if 
      
  #   else
      
  #   end
  # end

  private

  def request_params
    params.require(:request).permit Request::REQUEST_PARAMS
  end

  def list_requests
    Request.where schedule_id: Schedule.user_schedules(current_user.id) unless current_user.pilot?
    Request.all
  end

  def find_request
    @requests = Request.find_by id: params[:id]
  end
end
