class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :attachment
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
