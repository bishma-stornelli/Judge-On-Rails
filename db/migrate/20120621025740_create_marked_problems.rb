class CreateMarkedProblems < ActiveRecord::Migration
  def change
    create_table :marked_problems do |t|
      t.string :status
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end
    
    add_index :marked_problems, :user_id
    add_index :marked_problems, :problem_id
    add_index :marked_problems, [:user_id, :problem_id], uniqueness: true
  end
end
