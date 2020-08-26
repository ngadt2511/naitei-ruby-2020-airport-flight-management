class Schedule < ApplicationRecord
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
end
