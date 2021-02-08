class UsersController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  before_action :login?, only: :show

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "サインアップできました"
      redirect_to user_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user.id)
  end
  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = "更新されました"
      redirect_to current_user
    else
      render "new"
    end
  end

    private
      def user_params
        params.require(:user).permit(
          :name,
          :email,
          :userimage,
          :password,
          :password_confirmation)
      end
end
