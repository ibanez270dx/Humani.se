class BlogController < ApplicationController
  
  def index
    @posts = Post.enabled
  end
  
  def show
    @post = Post.find_by_url_title params[:url_title]
  end
    
end