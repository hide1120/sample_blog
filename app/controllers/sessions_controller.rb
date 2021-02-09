class SessionsController < ApplicationController
  before_action :logged_in?, except: :destroy

  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      flash[:success] = "ログインしました"
      redirect_to :root
    else
      flash.now[:danger] = "ログインできませんでした"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "ログアウトしました"
    redirect_to :root
  end
end
