class BuddiesController < ApplicationController
  # before_action :set_buddy, only: [:show ]

  def show
    @user = User.all
  end
end
