require 'spec_helper'

describe Solution do
  before do
    @user = FactoryGirl.create(:user)
    @task = FactoryGirl.create(:task)
    @solution = FactoryGirl.create(:solution, user: @user, task: @task)
  end

  subject { @solution }

  it { should respond_to(:user_id) }
  it { should respond_to(:task_id) }
  it { should respond_to(:attachment) }

  it { should be_valid }

end
