class Schedule < ApplicationRecord
  belongs_to :runway
  belongs_to :plane
  belongs_to :user
  has_many :notifications, dependent: :nullify
  has_many :logs, dependent: :nullify

  scope :user_schedules, ->(ids){select(:id).where("schedules.user_id = ?", ids)}
end
