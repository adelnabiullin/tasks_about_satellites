class SolutionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @solution  = current_user.solutions.build(solution_params)
    if @solution.save
      flash[:success] = "Решение удачно загружено!"
    end
    render task_path([:id])
  end

  def destroy

  end

  private

  def solution_params
    params.require(:solution).permit(:attachment)
  end
end
