require_relative '../../concerns/helpers.rb'

class Api::V1::TeachersController < ApplicationController
  def show
    @teacher = params[:id].nil? ? Helpers.get_all_teachers : Helpers.show_each_user(params[:id])
    render json: { status: 'Success', message: 'Success getting teacher', data: @teacher }
  end

  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @teacher = @user.userref
    if @teacher.update(description: params[:description])
      render json: { status: 'Success', message: 'Updated Successfully', data: @teacher }
    else
      render json: { status: 'Error', message: 'Error updating', data: @teacher.errors.full_messages }
    end
  end
end
