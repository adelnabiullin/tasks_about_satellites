class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :task_id
      t.integer :test_number
      t.string :input_data
      t.string :output_data

      t.timestamps
    end
  end
end
