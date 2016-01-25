class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.order("updated_at DESC")
    @users = User.all
  end

  def about

  end


end
