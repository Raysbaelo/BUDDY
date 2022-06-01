class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :show];

  def index
    @tasks = Task.all
    @task = Task.new
    @user = current_user
  end

  def show
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def update
    @task.update(task_params)
      redirect_to tasks_path, notice: 'Garden was successfully updated.'

  end

  def edit
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

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: 'Task successfully removed'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :category, :frequence)
  end
end
