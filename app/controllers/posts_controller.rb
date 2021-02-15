class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(public_uid: params[:id])
  end
  def edit
    @post = Post.find_by(public_uid: params[:id])
  end
  def update
    @post = Post.find_by(public_uid: params[:id])
    if @post.update(post_params)
      flash[:success] = "更新されました"
      redirect_to @post
    else
      render "edit"
    end
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "保存に成功しました"
      redirect_to @post
    else
      render "new"
    end
  end

  def destroy
    @post = Post.find_by(public_uid: params[:id])
    @post.destroy
    flash[:danger] = "投稿を削除しました"
    redirect_to @post
  end

    private
      def post_params
        params.require(:post).permit(
          :title,
          :img,
          :urls,
          :body,
          :content
          )
      end
end
