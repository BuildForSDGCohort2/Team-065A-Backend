class Api::V1::UsersController < ApplicationController
  def create; end

  # update a particular user
  def update
    @user = User.find(params[:id])
    if @user.update(params)
      render json: { status: 'Success', message: 'Updated Successfully', data: @user }
    else
      render json: { status: 'Error', message: 'Error updating', data: @user.errors.full_messages }
    end
  end

  # show a particular user
  def show
    @user = User.find(params[:id])
    check_user_nil('Success', 'Error getting user', @user)
    # if !@user.nil?
    #   render json: { status: 'Success', message: 'Success', data: @user }
    # else
    #   render json: { status: 'Error', message: 'Error getting user', data: @user.errors.full_messages }
    # end
  end

  # show all users
  def show_all
    @user = User.all
    check_user_nil('Success', 'Error getting users', @user)
    # if !@user.nil?
    #   render json: { status: 'Success', message: 'Success', data: @user }
    # else
    #   render json: { status: 'Error', message: 'Error getting users', data: @user.errors.full_messages }
    # end
  end

  # destroy a user
  def destroy
    @user = User.find(params[:id])
    if !@user.nil?
      @user.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'Error deleting', data: @user.errors.full_messages }
    end
  end

  private

  def check_user_nil(success_msg, error_msg, data_info)
    if !@user.nil?
      render json: { status: 'Success', message: success_msg, data: data_info }
    else
      render json: { status: 'Error', message: error_msg, data: @user.errors.full_messages }
    end
  end
end
