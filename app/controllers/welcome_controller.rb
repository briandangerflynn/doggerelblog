class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.order("updated_at DESC")
    @users = User.limit(10)
  end

  def about

  end


end
