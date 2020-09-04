class Parent < ApplicationRecord
  has_one :user, as: :userref
  has_many :reviews
end
