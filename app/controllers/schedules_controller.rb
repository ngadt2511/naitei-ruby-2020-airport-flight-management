class SchedulesController < ApplicationController
  before_action :check_air_traffic_officer, :find_schedule, only: %i(edit update)

  def index
    @schedules = current_user.schedules.page(params[:page]).per Settings.pagination.page
  end

  def show
    request_schedule = Schedule.find_by id: params[:id]
    render json: {request_schedule: request_schedule}
  end

  def edit; end

  def update
    respond_to do |format|
      if Schedule.checkrunway? params.require(:schedule)
        @schedule.update schedule_params
        format.html{redirect_to schedules_url}
      else
        @runway_able = Schedule.find_runwayable params.require(:schedule)[:time]
        format.js {}
        format.json{render :edit, location: @runway_able}
      end
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit Schedule::SCHEDULES_PARAMS
  end

  def check_air_traffic_officer
    redirect_to root_url unless current_user.air_traffic_officer?
  end

  def find_schedule
    @schedule = Schedule.find_by id: params[:id]
    flash[:danger] = t ".noId" if @schedule.nil?
  end
end
