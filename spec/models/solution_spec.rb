require 'spec_helper'

describe Solution do
<<<<<<< HEAD

	before do
		@user = FactoryGirl.create(:user)
		@task = FactoryGirl.create(:task)
			# решение с правильным документом
		@solution = FactoryGirl.create(:solution)
		@solution.user_id = @user.id
		@solution.task_id = @task.id
	end

	subject { @solution }

	it { should respond_to :content }
	it { should respond_to :user_id }
	it { should respond_to :task_id }
end
=======
  pending "add some examples to (or delete) #{__FILE__}"
end
>>>>>>> file-uploads-paperclip
