class MarkedProblemsController < ApplicationController
  # Limiting functionallity with cancan
  load_and_authorize_resource except: :update
  def index
    @problems = current_user.problems.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  def create
    if @marked_problem = current_user.marked_problems.create(params[:marked_problems])
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @marked_problem = MarkedProblem.find_by_user_id_and_problem_id(current_user.id , params[:marked_problem][:problem_id])
    # This must to be manual since the marked_problem is not being found by id
    authorize! :update, @marked_problem
    problem = @marked_problem.problem
    path = "#{Rails.root}/public/#{rand()}"
    File.open(path, "w+") { |f| f.write(params[:marked_problem][:solution].read) }
    @output = `ruby #{path} < #{problem.input.path}`
    solution = File.new(problem.solution.path).read
    
    if @output == solution
      status = MarkedProblem::STATUS_SOLVED
    else
      status = MarkedProblem::STATUS_WRONG
    end
    File.delete(path)

    respond_to do |format|
      if @marked_problem.update_attributes(status: status)
        flash.now[:notice] = "Congratulations! Your program is correct!" if status == MarkedProblem::STATUS_SOLVED
        if status == MarkedProblem::STATUS_WRONG
          flash.now[:error] = "Wrong answer! Try again!"
        end 
      else
        flash.now[:error] = "An error occur while proccesing your answer. Please try again later."
      end
      format.js
    end
  end
end
