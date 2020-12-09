class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @birthday = current_user.birthday
    @posts = current_user.posts
  end
end
