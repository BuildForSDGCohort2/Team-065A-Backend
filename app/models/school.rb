class School < ApplicationRecord
    has_one :users, as: :userref
end