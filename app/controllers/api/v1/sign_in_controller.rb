class Api::V1::SignInController < ApplicationController

  #post endpoint for sign in
  def create

    #init param_email
    param_email = params[:login][:email]
    param_password = params[:login][:password]

    #make sure we can sign in using both email and full name
    #TODO will add phone number later
    user = User.find_by(email: param_email) || User.find_by(full_name: param_email)

    #check if password is correct
    if user && user.authenticate(param_password)
      render json: {status: "Success", message: "Signed In Successfully"}
    else
      render json: {status: "Error", message: "Invalid Email/Password"}
  end

  def show
    render json: {status: "Error", message: "Nothing for now"}
  end

end
