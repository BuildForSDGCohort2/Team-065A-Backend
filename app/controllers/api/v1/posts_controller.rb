require_relative '../../concerns/helpers.rb'

class Api::V1::PostsController < ApplicationController
  def create
    @user = Helpers.check_user_find_nil(params[:id])
    @user.userref.posts << Post.new(post_params)
    @post = @user.userref.posts.last
    if @post.save
      render json: { status: 'Success', message: 'Successfully created', data: @post }
    else
      render json: { status: 'Error', message: 'Post creation Failed', more: @post.errors.full_messages }
    end
  end

  def update
    @user = Helpers.check_user_find_nil(params[:id])
    @post = @user.userref.posts[params[:no].to_i]
    if @post.update(post_params) # change this
      render json: { status: 'Success', message: 'Updated Successfully', data: @post }
    else
      render json: { status: 'Error', message: 'Error updating', data: @post.errors.full_messages }
    end
  end

  def destroy
    @user = Helpers.check_user_find_nil(params[:id])
    @post = @user.userref.posts[params[:no].to_i]
    if !@user.nil?
      @post.destroy
      render json: { status: 'Success', message: 'Successfully deleted' }
    else
      render json: { status: 'Error', message: 'User does not exist' }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  rescue StandardError
    nil
  end
end
