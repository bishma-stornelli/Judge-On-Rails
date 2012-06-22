
class MarkedProblemsController < ApplicationController
  def index
    @problems = current_user.problems.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  def create
    if @marked_problem = current_user.marked_problems.create(params[:marked_problems])
      flash[:success]= "String de prueba"
      respond_to do |format|
        format.js
      end
    else
      
    end
  end
  
  def update
    @marked_problem = MarkedProblem.find_by_user_id_and_problem_id(current_user.id , params[:id])
    # Aqui manejo el archivo que sube el usuario y lo corro para ver si esta bueno o malo
    # Corro el programa y suponiendo que me devuelve una variable status
    status = 0
    
    respond_to do |format|
      if @marked_problem.update_attributes(status: status)
        flash.now[:success] = "Congratulations! Your program is correct!" if status == MarkedProblem::STATUS_SOLVED
        flash.now[:error] = "Wrong answer! Try again!" if status == MarkedProblem::STATUS_WRONG
        format.js
      else
        format.js
      end
    end
  end
end
