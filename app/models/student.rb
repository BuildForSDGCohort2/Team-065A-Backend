class Student < ApplicationRecord
    has_one :users, as: :userref
end
