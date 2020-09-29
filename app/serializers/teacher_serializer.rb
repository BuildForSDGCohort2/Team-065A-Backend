class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :description

  has_one :user, as: :userref
  has_many :courses, through: :teachers_courses
  has_many :educations
  has_many :reviews
  has_many :posts
end
