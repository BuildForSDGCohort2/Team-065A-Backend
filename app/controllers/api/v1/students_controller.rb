require_relative '../../concerns/helpers.rb'

class Api::V1::StudentsController < ApplicationController
  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @student = @user.userref
    if @student.update(user_params)
      render json: { status: 'Success', message: 'Updated Successfully', data: @student }
    else
      render json: { status: 'Error', message: 'Error updating', data: @student.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:student).permit(:age, :level, :mycourses)
  end
end
