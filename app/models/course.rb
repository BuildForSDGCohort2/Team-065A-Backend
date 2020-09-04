class Course < ApplicationRecord
  has_many :teachers_courses
  has_many :teachers, through: :teachers_courses
  end
