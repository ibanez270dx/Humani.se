class Post::PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create params[:post]
    if @post.save
      flash[:notice] = "Post created successfully."
      redirect_to admin_posts_path
    else
      render action: 'new'
    end
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find params[:id]
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully."
      redirect_to admin_posts_path
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:notice] = "Post destroyed successfully."
    redirect_to admin_posts_path
  end
  
  
end