class AddFormulaToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :formula, :string
  end
end
