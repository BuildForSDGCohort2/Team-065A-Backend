require_relative '../../concerns/helpers.rb'

class Api::V1::ReviewsController < ApplicationController
  def create
    @user = Helpers.check_user_find_nil(params[:id])
    reviewee_info = Helpers.get_user_type_id(params[:reviewee_id])
    params[:review][:owner] = @user.full_name
    params[:review][:teacher_id] = reviewee_info[1]
    params[:review][:teacher] = reviewee_info[0]
    @user.userref.reviews << Review.new(new_params)
    @review = @user.userref.reviews.last
    if @review.save
      render json: { status: 'Success', message: 'Successfully created', data: @review }
    else
      render json: { status: 'Error', message: 'Course creation Failed', more: @review.errors.full_messages }
    end
      end

  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @review = @user.userref.reviews[params[:no].to_i]
    if @review.update(new_params)
      render json: { status: 'Success', message: 'Updated Successfully', data: @review }
    else
      render json: { status: 'Error', message: 'Error updating', data: @review.errors.full_messages }
    end
  end

  def destroy
    @user = Helpers.check_user_find_nil(params[:id])
    @review = @user.userref.reviews[params[:no].to_i]
    if !@user.nil?
      @review.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'User does not exist' }
    end
  end

  private

  def new_params
    params.require(:review).permit(:content, :rating, :owner, :teacher, :teacher_id)
  rescue StandardError
    nil
  end
end
