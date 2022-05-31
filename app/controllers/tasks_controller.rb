class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
    @user = current_user

  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save

      redirect_to tasks_path

    else
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :category, :frequence)
  end
end
