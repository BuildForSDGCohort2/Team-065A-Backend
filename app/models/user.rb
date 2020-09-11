class User < ApplicationRecord
  attr_accessor :reset_token
  #:remember_token, :activation_token,
  belongs_to :userref, class_name: 'User', polymorphic: true, optional: true
  mount_uploader :avatar, AvatarUploader

  # make sure we convert all lazy emails to downcase
  before_save do
    self.email = email.downcase
  end

  # validate full_name to allow maximum of 50 letters
  validates :full_name, presence: true, length: { maximum: 50 }

  # regex from Micheal Hartl book very useful will work on it later
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # regex may be buggy since i just came up with something - supports
  # all african numbers
  VALID_PHONE_REGEX = /\A((\+\d{11,15})|(^+\d{8,15}))\z/.freeze

  # validate usertype
  validates :user_type, presence: true

  # validate phone allow_blank since its optional on the signup page
  validates :phone, allow_blank: true, format: { with: VALID_PHONE_REGEX }

  # validate email
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # validate password
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, if: :password

  # returns a hash of the string
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:forgot_password_digest, User.digest(reset_token))
    update_attribute(:forgot_password_sent_at, Time.zone.now)
    end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.forgot_password(self).deliver_now
  end

  def password_reset_expired?
    forgot_password_sent_at < 2.hours.ago
    end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password?(token)
  end
end
