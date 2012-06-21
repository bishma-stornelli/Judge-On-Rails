class CreateMarkedProblems < ActiveRecord::Migration
  def change
    create_table :marked_problems do |t|
      t.string :status
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
