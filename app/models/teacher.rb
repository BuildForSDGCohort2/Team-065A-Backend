class Teacher < ApplicationRecord
  has_one :user, as: :userref
  has_and_belongs_to_many :courses
  has_many :educations
  has_many :reviews
  has_many :posts
end

class Education < ApplicationRecord
  mount_uploader :certificate_proof, FileUploader
end

class Course < ApplicationRecord
  has_and_belongs_to_many :teachers
end

class Review < ApplicationRecord
  has_one :rating
end

class Post < ApplicationRecord
end

class Rating < ApplicationRecord
  has_many :teachers
end
