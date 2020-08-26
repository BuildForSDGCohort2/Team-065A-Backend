class User < ApplicationRecord
  # make sure we convert all lazy emails to downcase
  before_save { self.email = email.downcase }

  # validate full_name to allow maximum of 50 letters, to be unique
  validates :full_name, presence: true, length: { maximum: 50 }, uniqueness: true

  # regex from Micheal Hartl book very useful will work on it later
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # validate email
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # validate password
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
