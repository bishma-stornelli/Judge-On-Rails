class AddSolutionFileToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :solution_file, :string
  end
end
