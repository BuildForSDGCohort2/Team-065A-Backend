class Api::V1::SignUpController < ApplicationController
  def create

    # check if params is null
    if user_params.nil?
      render json: { status: 'Error', message: 'Parameters Empty' }
      return
    end

    # params is not nil, so make a new instance of user
    @user = User.new(user_params)

    #if user is valid , save to the database else send an error response
    if @user.save
      render json: { status: 'Success', message: 'Succesful Signup', data: @user }
    else
      render json: { status: 'Error', message: 'Sign up Failed', more: @user.errors.full_messages }
    end

  end

  #nothing to show for a get request to this endpoint
  def show
    render json: { status: 'Error', message: 'Nothing for now' }
  end

  private
    #private method to get the params
    def user_params
      params.require(:users).permit(:full_name, :email, :password, :password_confirmation)
    rescue StandardError
      nil
    end

end