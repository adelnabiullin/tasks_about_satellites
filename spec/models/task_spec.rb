require 'spec_helper'

describe Task do
	before { @task = Task.new(name: "Megasatellites", content: "Lorem ipsum") }

	subject { @task }

	it { should respond_to(:name) }
	it { should respond_to(:content) }
end
