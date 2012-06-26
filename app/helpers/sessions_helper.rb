module SessionsHelper
  def sign_in user
    session[:user_id] = user
    self.current_user = user
  end
  
  def signed_in?
    !self.current_user.nil?
  end  
  
  def current_user= user
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
  
  def sign_out
    self.current_user = session[:user_id] = nil
  end
  
  def signin_path
    "/sessions/new"
  end
end
