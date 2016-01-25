class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end


  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = current_user.posts.new
  end


  def create
    @user = current_user
    @user.posts.create(safe_post_params)
    redirect_to user_posts_path(@user)
  end

  def upvote
  @post = Post.find(params[:id])
  @post.votes.create
  redirect_to(root_path)
  end




  private

  def safe_post_params
    params.require(:post).permit(:title, :body)
  end

end
