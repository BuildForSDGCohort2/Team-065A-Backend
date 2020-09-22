class Helpers < ApplicationController
  def self.show_each_user(id)
    unless id.nil?
      user = check_user_find_nil(id)
      return nil if user.nil?

      usertype = user.userref
      info = { profile: UserSerializer.new(user).as_json, reviews: usertype.reviews }
      if usertype.is_a? Teacher
        return { profile: TeacherSerializer.new(usertype).as_json, rating: get_avg_rating_from_reviews(usertype.reviews) }
      end

      info
    end
  end

  def self.remember(user)
    user.remember
    # cookies.permanent.encrypted[:user_id] = user.id
    # cookies.permanent[:remember_token] = user.remember_token
  end

  def self.forget(user)
    user.forget
    # cookies.delete(:user_id)
    # cookies.delete(:remember_token)
  end

  def self.check_user_find_nil(id)
    User.find(id)
  rescue StandardError
    nil
  end

  def self.filter_teachers_by_course
    Course.all.map do |y|
      {
        coursename: y.coursename,
        teachers: get_all_info_map(y.teachers)
      }
    end
  end

  def self.filter_teachers_by_specific_course(coursename)
    course = Course.find_by(coursename: coursename)
    get_all_info_map(course.teachers)
  end

  def self.get_avg_rating_for_teacher(id)
    teacher_reviews = User.find(id).userref.reviews
    return 0 if teacher_reviews.length == 0

    total_rating = 0
    teacher_reviews.each do |x|
      total_rating += x.rating
    end
    total_rating / teacher_reviews.length
  end

  def self.get_user_type_id(userid)
    user = User.find(userid)
    [user.full_name, user.userref.id]
  end

  def self.get_all_teachers
    get_all_info_map(Teacher.all)
  end

  def self.get_avg_rating_from_reviews(review)
    return 0 if review.length == 0

    total_rating = 0
    review.each do |x|
      total_rating += x.rating
    end
    total_rating / review.length
  end

  def self.get_all_info_map(z)
    z.map { |x| { info: TeacherSerializer.new(x).as_json, rating: get_avg_rating_from_reviews(x.reviews) } }
    # z.map { |x| { profile: x.user, info: x, courses: x.courses, reviews: x.reviews, posts: x.posts, educations: x.educations, rating: get_avg_rating_from_reviews(x.reviews) } }
  end

  def self.get_all_posts_map(z)
    z.map { |x| PostSerializer.new(x).as_json }
  end

  def self.get_all_reviews_map(z)
    z.map { |x| ReviewSerializer.new(x).as_json }
  end
end
