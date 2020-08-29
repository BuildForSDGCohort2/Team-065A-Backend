class Api::V1::StudentsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @student = @user.userref
    render json: {status: "Success", message: "Success getting student", data: @student}
  end
end
