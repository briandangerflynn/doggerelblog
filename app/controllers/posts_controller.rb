class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @posts = @user.posts.order("updated_at DESC")
  end


  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end


  def new
    @post = current_user.posts.new
  end


  def create
    @user = current_user
    @user.posts.create(safe_post_params)
    redirect_to user_posts_path(@user)
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(safe_post_params)
      redirect_to root_path
    else
      redirect_to edit_post_path
    end
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
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
