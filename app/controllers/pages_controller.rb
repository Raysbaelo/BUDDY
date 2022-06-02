class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :loading]
  before_action :disable_nav, only: [:loading]

  def home
  end

  def loading
  end

  def graph

  end

  def calender

  end
end
