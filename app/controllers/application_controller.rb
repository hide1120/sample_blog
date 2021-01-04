class ApplicationController < ActionController::Base
  helper_method :current_user

  # ログインしていない場合
  def login?
    if current_user.nil?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
  # すでにログイン済みの場合
  def logged_in?
    unless current_user.nil?
      redirect_to user_path
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end

  def authenticate_user
    if current_user == nil
      redirect_to('/')
    end
  end
end
