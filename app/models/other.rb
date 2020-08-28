class Other < ApplicationRecord
  has_one :users, as: :userref
end
