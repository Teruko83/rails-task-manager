# frozen_string_literal: true

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
    Task.create(task_params)
    redirect_to index_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
