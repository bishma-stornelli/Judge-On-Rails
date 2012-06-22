require 'paperclip'
class Problem < ActiveRecord::Base
  attr_accessible :code, :description, :input_format, :name, :output_format, :solution, :input
  has_attached_file :solution
  has_attached_file :input
  
  before_validation do |problem|
    if !problem.code
      begin
        problem.code = (0...5).map{(r = rand(36)) < 26 ? (65+r).chr : (79+r-26).chr}.join
      end while Problem.find_by_code problem.code
    end
  end

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :input_format, presence: true
  validates :output_format, presence: true

end
