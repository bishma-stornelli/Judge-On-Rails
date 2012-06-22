module MarkedProblemsHelper
  def has_marked? problem
    current_user.problems.include? problem
  end
  
  def problem_status problem
    mp = current_user.marked_problems.find_by_problem_id(problem.id)
    mp.status.to_i if mp
  end
  
  def problem_status_display problem
    mp = current_user.marked_problems.find_by_problem_id(problem.id)
    mp.get_status_display if mp
  end
end
