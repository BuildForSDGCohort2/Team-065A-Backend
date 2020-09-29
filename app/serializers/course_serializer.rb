class CourseSerializer < ActiveModel::Serializer
  attributes :coursename
  has_many :teachers, through: :teachers_courses
end
