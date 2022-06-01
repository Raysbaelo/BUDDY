class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :disable_nav, only: [:loading]

  def home
  end

  def loading
  end
end
