class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.page(params[:page]).per Settings.pagination.page
  end
end
