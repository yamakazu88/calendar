class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user).order("start_time DESC").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :title, :reason, :memo, :category_id).merge(user_id: current_user.id)
  end
end
