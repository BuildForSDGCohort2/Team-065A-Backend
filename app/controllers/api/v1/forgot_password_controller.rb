class Api::V1::ForgotPasswordController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:forgot_password][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      render json: { status: 'Success', message: 'Email sent with password reset instructions' }
    else
      render json: { status: 'Error', message: 'Email address not found', data: @user.errors_full_messages }
    end
  end

  def edit; end
end
