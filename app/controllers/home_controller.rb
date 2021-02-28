class HomeController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).limit(6)
    @banners = Banner.order(created_at: :desc)
  end
end
