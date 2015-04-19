require 'spec_helper'

describe Task do
  before { @task = FactoryGirl.create(:task) }

  subject { @task }

  it { should respond_to(:name) }
  it { should respond_to(:content) }
end
