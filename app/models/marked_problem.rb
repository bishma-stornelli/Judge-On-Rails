class MarkedProblem < ActiveRecord::Base
  attr_accessible :problem_id, :status, :user_id
  
  belongs_to :user
  belongs_to :problem
  
  # VALIDATIONS
  STATUS_OPTIONS = [['Solved', 0], ['Wrong answer', 1], ['Pending', 2]]
  validates :status, in: STATUS_OPTIONS
  
end
