class AddIndexesToSolutionsUserIdAndTaskId < ActiveRecord::Migration
  def change
    add_index :solutions, :user_id
    add_index :solutions, :task_id
    add_index :solutions, [:user_id, :task_id]
  end
end
