class BannersController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @banners = Banner.order(created_at: :desc)
  end

  def new
    @banner = Banner.new
  end
  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      flash[:success] = "保存に成功しました"
      redirect_to :root
    else
      render "new"
    end
  end

    private
      def banner_params
        params.require(:banner).permit(
          :title,
          :img
        )
      end
end
