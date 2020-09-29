require_relative '../../concerns/helpers.rb'

class Api::V1::SignInController < ApplicationController
  # post endpoint for sign in
  def create
    # check if params is null
    # init param_email
    begin
      param_email = params[:login][:email]
    rescue StandardError
      render json: { status: 'Error', message: 'Empty Parameters' }
      return
    end
    param_password = params[:login][:password]

    # make sure we can sign in using both email
    user = User.find_by(email: param_email)

    # check if password is correct
    if user&.authenticate(param_password)
      params[:login][:remember_me] == '1' ? Helpers.remember(user) : Helpers.forget(user)
      render json: { status: 'Success', message: 'Signed In Successfully', data: UserSerializer.new(user).as_json }
    else
      render json: { status: 'Error', message: 'Invalid Email/Password' }
    end
  end

  def show
    render json: { status: 'Error', message: 'Nothing for now' }
  end
end
