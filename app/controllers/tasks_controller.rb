class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy];


  def index
    @user = current_user
    @task = Task.new
    @tasks = @user.current_tasks

  end

  def new
    @task = Task.new

  end

  def edit
  end

  def update
    @task.done!

    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      generate_occurances(@task)
      redirect_to tasks_path
    else
      render :new
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
    params.require(:task).permit(:name, :category)
  end

  def generate_occurances(task)
    60.times do |i|
      data = i.days.from_now
      Occurance.create!(task: task, date: data, done: false)
    end
  end
end
