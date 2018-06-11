class BlogController < ApplicationController

  def index
    @posts = Post.enabled
  end

  def show
    @post  = Post.find_by_slug params[:slug]
    @posts = Post.where.not slug: params[:slug]
  end

end
