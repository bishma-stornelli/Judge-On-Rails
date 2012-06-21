class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to Online Judge on Rails."
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to "/"
  end
end
