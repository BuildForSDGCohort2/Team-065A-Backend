require_relative '../../concerns/helpers.rb'

## only for teachers

#
# PARAMETERS
# id = the id of the user
# coursename  = the name of the course
# no = the index of the course among the plenty courses a teacher might have
#

class Api::V1::CoursesController < ApplicationController
  def create
    @user = Helpers.check_user_find_nil(params[:id])
    usertype = @user.userref
    newcourse = Course.new(coursename: params[:coursename])
    usertype.courses << newcourse
    @course = usertype.courses.last
    if @course.save
      render json: { status: 'Success', message: 'Successfully created', data: CourseSerializer.new(@course).as_json }
    else
      render json: { status: 'Error', message: 'Course creation Failed', more: @course.errors.full_messages }
    end
  end

  # to show my courses pass use student_show
  # to sort teachers according to courses pass course
  def show
    @course = params[:coursename].nil? ? Helpers.filter_teachers_by_course : Helpers.filter_teachers_by_specific_course(params[:coursename])
    render json: { status: 'Success', message: 'Successfully filtered', data: @course }
  end

  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @course = @user.userref.courses[params[:no].to_i]
    if @course.update(coursename: params[:coursename])
      render json: { status: 'Success', message: 'Updated Successfully', data: CourseSerializer.new(@course).as_json }
    else
      render json: { status: 'Error', message: 'Error updating', data: @course.errors.full_messages }
    end
  end

  def destroy
    @user = Helpers.check_user_find_nil(params[:id])
    @course = @user.userref.courses[params[:no].to_i]
    if !@user.nil?
      @course.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'User does not exist' }
    end
  end
end
