class TasksController < ApplicationController
  def show
  	@task = Task.find(params[:id])
  end

  def new
  	@task = Task.new
  end
end
