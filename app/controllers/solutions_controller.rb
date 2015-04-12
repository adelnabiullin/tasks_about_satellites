class SolutionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @solution  = current_user.solutions.build(solution_params)
    if @solution.save
      flash[:success] = "Решение удачно загружено!"
    end
    redirect_to task_path(@solution.task)
  end

  def destroy

  end

  private

  def solution_params
    params.require(:solution).permit(:task_id, :attachment)
  end
end
