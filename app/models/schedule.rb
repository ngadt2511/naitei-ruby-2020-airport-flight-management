class Schedule < ApplicationRecord
  SCHEDULES_PARAMS = %i(time status title from to runway_id plane_id user_id).freeze

  belongs_to :runway
  belongs_to :plane
  belongs_to :user
  has_many :notifications, dependent: :nullify
  has_many :logs, dependent: :nullify
  has_many :requests, dependent: :nullify

  delegate :name, to: :runway, prefix: :runway
  delegate :name, to: :user, prefix: :user
  delegate :name, to: :plane, prefix: :plane

  scope :user_schedules, ->(ids){select(:id).where("schedules.user_id = ?", ids)}
  scope :time_schedules, ->(time){where(time: time)}
  scope :all_schedules_now, ->(time){where("schedules.time >= ?", time.to_datetime)}

  class << self
    def checkrunway? params
      schedules = Schedule.time_schedules params[:time].to_datetime
      check_runwayid_form? schedules, Runway.all.size, params[:runway_id].to_i
    end

    def check_runwayid_form? schedules, count, runway_id
      @runway_able = Array.new
      if runway_id > count
        @runway_able << Settings.value.boolean_false
        return false
      end
      schedules.each do |schedule|
        if schedule.runway_id == runway_id
          @runway_able << Settings.value.boolean_true
          return false
        end
      end
      true
    end

    def find_runwayable time
      schedules = Schedule.time_schedules time.to_datetime
      runway_used = Array.new
      schedules.each do |schedule|
        runway_used[schedule.runway_id] = Settings.value.boolean if runway_used[schedule.runway_id].blank?
      end
      (1..Runway.all.size).each do |runway_id|
        @runway_able << Runway.find_by(id: runway_id) if runway_used[runway_id].blank?
      end
      @runway_able
    end
  end
end
