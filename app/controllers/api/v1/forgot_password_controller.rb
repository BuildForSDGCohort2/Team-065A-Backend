class Api::V1::ForgotPasswordController < ApplicationController
  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      render json: { status: 'Success', message: 'Email sent with password reset instructions' }
    else
      render json: { status: 'Error', message: 'Email address not found' }
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
    @user.errors.add(:email, 'Invalid User') unless valid_user
    @user.errors.add(:expiration, 'Token expired') unless check_expiration
    if params[:users][:password].empty?
      @user.errors.add(:password, "Can't be empty")
      render json: { status: 'Error', message: 'Email address not found', data: @user.errors.full_messages }
    elsif @user.update(user_params)
      render json: { status: 'Success', message: 'Password has been reset' }
    else
      render json: { status: 'Error', message: 'Unknown Error', data: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:users).permit(:password, :password_confirmation)
  end

  # Confirms a valid user.
  def valid_user
    @user&.authenticated?(:forgot_password, params[:id])
  end

  # Checks expiration of reset token.
  def check_expiration
    @user.password_reset_expired?
  end
end
