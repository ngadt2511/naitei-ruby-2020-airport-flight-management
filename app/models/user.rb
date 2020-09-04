class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = Settings.user.email_regex

  USERS_PARAMS = %i(name staff_code email).freeze

  enum type_account: {admin: 0, air_traffic_officer: 1, pilot: 2}

  has_many :schedules, dependent: :nullify

  before_save :downcase_email

  scope :all_pilots, ->(type_account){where("users.type_account = ?", type_account)}

  private

  def downcase_email
    email.downcase!
  end
end
