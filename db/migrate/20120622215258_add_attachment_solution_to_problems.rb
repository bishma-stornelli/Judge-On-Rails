class AddAttachmentSolutionToProblems < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.has_attached_file :solution
    end
  end

  def self.down
    drop_attached_file :problems, :solution
  end
end
