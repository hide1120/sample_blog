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
  end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
end
