class UsersController < ApplicationController
  skip_before_action :check_profile!

  def edit_profile
  end

  def update_profile
    current_user.update!(user_params)
    ap "je usis la"
    GenerateTasks.new.call(current_user)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:category_sport, :category_business, :category_hobby, :category_health)
  end
end
