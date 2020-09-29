# will use this class later

# class CustomUserController < ApplicationController
#   def update
#     @user = Helpers.check_user_find_nil(params[:id])
#     @other = @user.userref
#     if @other.update(user_params)
#       return true,@other
#        { status: 'Success', message: 'Updated Successfully', data: @other }
#     else
#       return false,@other.errors.full_messages
#        { status: 'Error', message: 'Error updating', data: @other.errors.full_messages }
#     end
#     end

#   private

#   def user_params
#     params.require(:user).permit(:age, :level, :mycourses)
#   end
# end
