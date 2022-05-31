class TasksController < ApplicationController

  def index
    @tasks = Task.all
    # @user = current_user
  end

  def new
    @task = Task.new

  end
end
