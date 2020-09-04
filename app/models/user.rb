class User < ApplicationRecord
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
end
