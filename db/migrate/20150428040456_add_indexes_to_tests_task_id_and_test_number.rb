class AddIndexesToTestsTaskIdAndTestNumber < ActiveRecord::Migration
  def change
    add_index :tests, :task_id
    add_index :tests, :test_number
    add_index :tests, [:task_id, :test_number]
  end
end
