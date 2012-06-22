class AddAttachmentInputToProblems < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.has_attached_file :input
    end
  end

  def self.down
    drop_attached_file :problems, :input
  end
end
