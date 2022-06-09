class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home, :loading]
  before_action :disable_nav, only: [:loading]
  before_action :set_general_score, if: :current_user

  def home
  end

  def loading
  end

  def graph

  end

  def set_general_score
    @general_score = current_user.tasks.done.count
  end


end
