class SolutionsController < ApplicationController
  require 'shell'

  before_action :signed_in_user
  before_action :correct_user_for_solution, only: :show

  def create
    @solution = current_user.solutions.build(solution_params)
    @task = @solution.task
    if @solution.save
      compile_java
      if File.read("public/uploads/solution/attachment/#{@solution.id}/compile.log").blank?
        flash[:success] = "Компиляция прошла успешно :)"
        # ..tests
      else
        flash[:error] = "Взгляните на ошибки компиляции под исходным кодом."
      end
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
    sh1 = Shell.new
    sh1.system("bash", "public/javac_check_script.sh", "#{@solution.id}")
    loop do
      break if File.exist?("public/uploads/solution/attachment/#{@solution.id}/javac_end.log")
    end
    sh1.system("rm", "-f", "public/uploads/solution/attachment/#{@solution.id}/javac_end.log")
  end
end
