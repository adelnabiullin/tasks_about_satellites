class TasksController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:new, :create, :destroy, :edit, :update]

  # нужно посмотреть, как табличку сделать
  def index
    @tasks = Task.paginate(page: params[:page])
  end

  def show
    @task = Task.find(params[:id])
    @solution = @task.solutions.build
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Ура! Вы пополнили орбиту спутниками. :)"
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "Задача обновлена."
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "Задача удалена."
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :formula)
  end
end
