class Teacher < ApplicationRecord
    has_one :users, as: :userref
end
