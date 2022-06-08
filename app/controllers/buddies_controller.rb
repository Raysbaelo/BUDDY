class BuddiesController < ApplicationController
  # before_action :set_buddy, only: [:show ]

  def show
    @user = User.all
    @general_score = current_user.tasks.done.count
  end


end
