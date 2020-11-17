class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
    # The line above allows to edit the variable which are locked by default (security layer)
    # Equivalent of the attr_writer
  end
end
