class User < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :schedules, dependent: :nullify

  VALID_EMAIL_REGEX = Settings.user.email_regex
  USERS_PARAMS = %i(name email password password_confirmation).freeze
  attr_accessor :remember_token, :change_token

  validates :name, presence: true,
    length: {maximum: Settings.user.name_length}
  validates :email, presence: true,
    length: {maximum: Settings.user.email_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password_min_length}, allow_nil: true

  before_save :downcase_email

  has_secure_password

  class << self
    def digest string
      cost =
        if ActiveModel::SecurePassword.min_cost
          BCrypt::Engine::MIN_COST
        else
          BCrypt::Engine.cost
        end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def create_change_digest
    self.change_token = User.new_token
    update change_digest: User.digest(reset_token), change_sent_at: Time.zone.now
  end

  def password_change_expired?
    change_sent_at < Settings.user.expired.hours.ago
  end

  private

  def downcase_email
    email.downcase!
  end
end
