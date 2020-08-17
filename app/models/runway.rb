class Runway < ApplicationRecord
  has_many :schedules, dependent: :nullify
end
