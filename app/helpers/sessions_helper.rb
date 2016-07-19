module SessionsHelper

  #create session with user id
  def log_in(user)
    session[:user_id] = user.id
  end

  #returns the current loggged in user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #check if there is a logged in user
  def logged_in?
    !current_user.nil?
  end

  #log user out
  def log_out
    forget(current_user)
    session[:user_id] = nil
    @current_user = nil
  end

  #save session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_to
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
