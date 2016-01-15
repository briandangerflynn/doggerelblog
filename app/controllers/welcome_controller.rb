class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.all
    @users = User.all
  end


end
