class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = Settings.user.email_regex

  enum type_account: {admin: 0, air_traffic_officer: 1, pilot: 2}

  has_many :schedules, dependent: :nullify

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
