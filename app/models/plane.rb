class Plane < ApplicationRecord
  has_many :schedules, dependent: :nullify
end
