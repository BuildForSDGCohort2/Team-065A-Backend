class Teacher < ApplicationRecord
  has_one :user, as: :userref
  has_many :teachers_courses
  has_many :courses, through: :teachers_courses
  has_many :educations
  has_many :reviews
  has_many :posts
  end
