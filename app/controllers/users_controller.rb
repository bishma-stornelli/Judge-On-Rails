
class UsersController < ApplicationController
  # Limiting functionality to non-admin users
  load_and_authorize_resource except: [ :new, :create]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        if current_user && current_user.admin?
          flash[:notice] = 'User was successfully created.'
          format.html { redirect_to @user }
          format.json { render json: @user, status: :created, location: @user }
        else
          flash[:notice] = "You've signed up successfully. Please sign in to resolve problems."
          format.html { redirect_to signin_path }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    # If the user doesn't fill the email_confirmation field and he didn't change
    # the email field then it should pass the confirmation
    old_email_confirmation = params[:user][:email_confirmation]
    if (params[:user][:email_confirmation] || "").empty? && @user.email == params[:user][:email]
      params[:user][:email_confirmation] = @user.email
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        @user.email_confirmation =  old_email_confirmation
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
