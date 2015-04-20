class SolutionsController < ApplicationController
  require 'shell'

  before_action :signed_in_user
  before_action :correct_user_for_solution, only: :show

  def create
    @solution  = current_user.solutions.build(solution_params)
    @task = @solution.task
    if @solution.save
      flash[:success] = "Решение удачно загружено!"
      compile_java
      # ..tests
      # ..etc
      redirect_to @solution
    else
      render 'tasks/show'
    end
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def index

  end

  private

  def solution_params
    params.require(:solution).permit(:task_id, :attachment)
  end

  def compile_java
    sh = Shell.new
    sh.cd("#{sh.dir}/public/uploads/solution/attachment/#{@solution.id}/")
    sh.system("javac", "-Xdiags:verbose", "-Xstdout", "compile.log", "sol.java")
  end
end
