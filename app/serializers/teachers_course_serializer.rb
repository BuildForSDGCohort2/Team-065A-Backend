class TeachersCourseSerializer < ActiveModel::Serializer
  belongs_to :teacher
  belongs_to :course
end
