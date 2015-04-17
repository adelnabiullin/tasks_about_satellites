class SolutionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @solution  = current_user.solutions.build(solution_params)
    @task = @solution.task
    if @solution.save
      flash[:success] = "Решение удачно загружено!"
      # redirect_to @solution
      # ..compile
      # ..tests
      # ..etc
      redirect_to task_path(@solution.task)
    else
      render 'tasks/show'
    end
  end

  def destroy

  end

  private

  def solution_params
    params.require(:solution).permit(:task_id, :attachment)
  end
end
