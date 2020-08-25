class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.page(params[:page]).per Settings.pagination.page
  end

  def show
    request_schedule = Schedule.find_by id: params[:id]
    render json: {request_schedule: request_schedule}
  end
end
