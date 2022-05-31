class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def disable_nav
    @disable_nav = true
  end
end
