module ApplicationHelper
  def get_current_user
    User.find_by_session_token(session[:session_token])
  end

  def require_current_user!
    redirect_to new_session_url if get_current_user.nil?
  end

  def logged_in?
    get_current_user.nil?
  end

  def login_user(user)
    user.session_token = User.generate_session_token
    session[:session_token] = user.session_token
    user.save!
    redirect_to user_url(user)
  end

  def logout
    user = get_current_user
    user.reset_session_token
    user.save!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
