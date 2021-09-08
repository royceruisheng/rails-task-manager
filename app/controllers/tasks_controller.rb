class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @updated_task = Task.find(params[:id])
    @updated_task.update(task_params)

    redirect_to task_path(@updated_task)
  end

  def create
    @task = Task.new(task_params)
    @task.save

    if @task.save
      redirect_to tasks_path
    end
  end

  def destroy
    @destroyed_task = Task.find(params[:id])
    @destroyed_task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
