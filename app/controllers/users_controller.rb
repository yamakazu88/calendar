class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @birthday = current_user.birthday
    @posts = current_user.posts
    @user = current_user

    #内科
    @post1 = Post.where(user_id: @user.id, category_id: 1)
    @category1 = Category.find(1)

    #外科
    @post2 = Post.where(user_id: @user.id, category_id: 2)
    @category2 = Category.find(2)

    #整形外科
    @post3 = Post.where(user_id: @user.id, category_id: 3)
    @category3 = Category.find(3)

    #皮膚科
    @post4 = Post.where(user_id: @user.id, category_id: 4)
    @category4 = Category.find(4)

    #眼科
    @post5 = Post.where(user_id: @user.id, category_id: 5)
    @category5 = Category.find(5)

    #耳鼻科
    @post6 = Post.where(user_id: @user.id, category_id: 6)
    @category6 = Category.find(6)

    #歯科
    @post7 = Post.where(user_id: @user.id, category_id: 7)
    @category7 = Category.find(7)

    #その他
    @post8 = Post.where(user_id: @user.id, category_id: 8)
    @category8 = Category.find(8)
  end
end
