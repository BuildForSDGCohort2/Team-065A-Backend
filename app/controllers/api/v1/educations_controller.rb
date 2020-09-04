require_relative '../../concerns/helpers.rb'

class Api::V1::EducationsController < ApplicationController
  def create
    @user = Helpers.check_user_find_nil(params[:id])
    @user.userref.educations << Education.new(new_params)
    @education = @user.userref.educations.last
    if @education.save
      render json: { status: 'Success', message: 'Successfully created', data: @education }
    else
      render json: { status: 'Error', message: 'Course creation Failed', more: @education.errors.full_messages }
    end
    end

  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @education = @user.userref.educations[params[:no].to_i]
    if @education.update(new_params) # change this
      render json: { status: 'Success', message: 'Updated Successfully', data: @education }
    else
      render json: { status: 'Error', message: 'Error updating', data: @education.errors.full_messages }
    end
  end

  def destroy
    @user = Helpers.check_user_find_nil(params[:id])
    @education = @user.userref.educations[params[:no].to_i]
    if !@user.nil?
      @education.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'User does not exist' }
    end
  end

  private

  def new_params
    params.require(:education).permit(:institution, :certificate, :year_from, :year_to, :certificate_proof)
  rescue StandardError
    nil
  end
end
