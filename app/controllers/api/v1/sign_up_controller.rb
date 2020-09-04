class Api::V1::SignUpController < ApplicationController
  def create
    @usertypes = %w[student teacher parent others school]
    @usertype_models = [Student, Teacher, Parent, Other, School]

    # check if params is null
    if user_params.nil?
      render json: { status: 'Error', message: 'Parameters Empty' }
      return
    end

    # check if password == passwordconfirm
    if params[:users][:password_confirmation] != params[:users][:password]
      render json: { status: 'Error', message: 'Password does not match' }
      return
    end

    # check if usertypes contains param[usertype]
    usertype = params[:users][:user_type]
    if usertype.nil? || !@usertypes.include?(usertype.downcase)
      render json: { status: 'Error', message: 'Invalid user type' }
      return
    end

    # params is not nil, so make a new instance of user
    @user = User.new(user_params)

    # if user is valid , save to the database else send an error response
    if check_user_type?
      render json: { status: 'Success', message: 'Succesful Signup', data: @user }
    else
      render json: { status: 'Error', message: 'Sign up Failed', more: @user.errors.full_messages }
    end
  end

  # nothing to show for a get request to this endpoint
  def show
    render json: { status: 'Error', message: 'Nothing for now' }
  end

  private

  # private method to get the params
  def user_params
    params.require(:users).permit(:full_name, :email, :password, :password_confirmation, :phone, :user_type)
  rescue StandardError
    nil
  end

  def check_user_type?
    @user.userref = @usertype_models[@usertypes.find_index(params[:users][:user_type])].new
    @user.save
  end
end
