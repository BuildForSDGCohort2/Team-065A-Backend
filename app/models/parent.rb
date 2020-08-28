class Parent < ApplicationRecord
  has_one :users, as: :userref
end
