class SiteController < ApplicationController
  
  def index
  end
  
  def blog
    @posts = Post.all.order('published_at desc')
  end
  
end
