class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def update
    @user.update(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:id)
  end
end
