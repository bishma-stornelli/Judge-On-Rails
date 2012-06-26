class MarkedProblem < ActiveRecord::Base
  attr_accessible :problem_id, :status, :user_id
  
  belongs_to :user
  belongs_to :problem
  
  # VALIDATIONS
  STATUS_SOLVED = 0
  STATUS_WRONG = 1
  STATUS_PENDING = 2
  STATUS_OPTIONS =  { STATUS_SOLVED => 'Solved', STATUS_WRONG => 'Wrong answer', STATUS_PENDING => 'Pending' }
  validates :status, inclusion: {in: STATUS_OPTIONS.map {|key,value| key}}
  validates :user_id, :problem_id, presence: true
  validates :user_id, uniqueness: {scope: :problem_id }
  
  # CALLBACKS
  after_initialize :default_values
  
  def get_status_display
    STATUS_OPTIONS[self.status.to_i]
  end

  private
    def default_values
      self.status ||= STATUS_PENDING
    end
end
