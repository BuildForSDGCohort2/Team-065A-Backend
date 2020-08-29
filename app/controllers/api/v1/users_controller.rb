class Api::V1::UsersController < ApplicationController
  # update the profile of a particular user
  def update
    @user = check_user_find_nil
    if @user.update(params) # change this
      render json: { status: 'Success', message: 'Updated Successfully', data: @user }
    else
      render json: { status: 'Error', message: 'Error updating', data: @user.errors.full_messages }
    end
  end

  # show a particular user / all users
  # show all users might be terrible buh lemme just put it there
  def show
    @user = params[:id].nil? ? User.all : check_user_find_nil
    check_user_nil('Success', 'User does not exist', @user)
  end

  # destroy a user
  def destroy
    @user = check_user_find_nil
    if !@user.nil?
      @user.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'User does not exist' }
    end
  end

  private

  def update_params
    params.require(:update).permit(:email, :phone, :gender, :address, :phone, :avatar, :state, :country)
  end

  def check_user_nil(success_msg, error_msg, data_info)
    if !@user.nil?
      render json: { status: 'Success', message: success_msg, data: data_info }
    else
      render json: { status: 'Error', message: error_msg }
    end
  end

  def check_user_find_nil
    User.find(params[:id])
  rescue StandardError
    nil
  end
end
