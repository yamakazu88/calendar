class PostsController < ApplicationController
  before_action :search_post, only: [:index, :search]

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

  def search
    @posts = Post.where(user_id: current_user).search(params[:keyword]).order("start_time DESC").page(params[:page]).per(5)
    @keyword = params[:keyword]
    @results = @p.result.includes(:category).order("start_time DESC").page(params[:page]).per(5)  # 検索条件にマッチした商品の情報を取得（詳細検索）
    set_post_column
    set_category_column
  end

  private

  def post_params
    params.require(:post).permit(:start_time, :title, :reason, :memo, :category_id).merge(user_id: current_user.id)
  end

  def search_post
    @p = Post.where(user_id: current_user).ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_post_column
    @post_title = Post.select("title").distinct  # 重複なくnameカラムのデータを取り出す
    @post_date = Post.select("start_time").distinct
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end
end
