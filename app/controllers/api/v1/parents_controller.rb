require_relative '../../concerns/helpers.rb'

class Api::V1::ParentsController < ApplicationController
  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @other = @user.userref
    if @other.update(user_params)
      render json: { status: 'Success', message: 'Updated Successfully', data: @other }
    else
      render json: { status: 'Error', message: 'Error updating', data: @other.errors.full_messages }
    end
    end

  private

  def user_params
    params.require(:user).permit(:age, :level, :mycourses)
  end
end
