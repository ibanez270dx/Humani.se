class BlogController < ApplicationController
  
  def index
    @posts = Post.enabled
  end
  
  def show
    @post = Post.find params[:id]
  end
    
end