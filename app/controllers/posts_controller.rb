class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "保存に成功"
      redirect_to :root
    else
      render "new"
    end

  end

    private
      def post_params
        params.require(:post).permit(
          :title,
          :body
          )
      end
end
