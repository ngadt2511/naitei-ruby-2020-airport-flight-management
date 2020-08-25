class Request < ApplicationRecord
  REQUEST_PARAMS = %i(schedule_id content).freeze

  belongs_to :schedule
end
