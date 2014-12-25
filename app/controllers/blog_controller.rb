class BlogController < ApplicationController

  def index
    @posts = Post.enabled
  end

  def show
    @post  = Post.find_by_url_title params[:url_title]
    @posts = Post.enabled.reject { |post| post.id==@post.id }
  end

end
