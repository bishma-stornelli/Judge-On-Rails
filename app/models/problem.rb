class Problem < ActiveRecord::Base
  attr_accessible :code, :description, :input_format, :name, :output_format
  
  before_save do |problem|
    if !problem.code
      begin
        problem.code = (0...5).map{(r = rand(36)) < 26 ? (65+r).chr : (79+r-26).chr}.join
      end while Problem.find_by_code problem.code
    end
  end

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :input_format, presence: true, length: { minimum: 20 }
  validates :output_format, presence: true, length: { minimum: 20 }
  
end
