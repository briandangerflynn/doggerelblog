class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.all
    @user_count = User.all.count
    @users = User.all
  end


end
