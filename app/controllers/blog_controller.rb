class BlogController < ApplicationController

  def index
    @posts = Post.all.order('published_at desc')
  end

end
