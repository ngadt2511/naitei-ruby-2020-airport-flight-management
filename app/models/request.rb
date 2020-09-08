class Request < ApplicationRecord
  REQUEST_PARAMS = %i(schedule_id title_request content).freeze

  enum status_request: {pending: 0, approve: 1, rejected: 2, canceled: 3}
  enum title_request: {late: 0, early: 1, absence: 2}

  belongs_to :schedule

  delegate :title, to: :schedule, prefix: :schedule

  after_save :create_notification

  scope :find_request_pending, ->{where status_request: Settings.status.request.pending}
  scope :find_request_by_user, ->(user_ids){where schedule_id: Schedule.user_schedules(user_ids)}
  scope :lastest_time, ->{order created_at: :desc}

  class << self
    def title_requests_i18n
      title_requests.each_with_object({}) do |(k, _), obj|
        obj[I18n.t("requests.title_requests.#{k}")] = k
      end
    end
  end

  private

  def create_notification
    Notification.create notification_params
  end

  def notification_params
    {title: status_request, content: content, status: Settings.status.notifications.unview,
     schedule_id: schedule_id, type_account: Settings.type_account.air_traffic}
  end
end
