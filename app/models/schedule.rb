class Schedule < ApplicationRecord
  belongs_to :runway
  belongs_to :plane
  belongs_to :user
  has_many :logs, dependent: :nullify
end
