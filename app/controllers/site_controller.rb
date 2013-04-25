class SiteController < ApplicationController
  
  def index
  end
  
  def blog
    @posts = Post.enabled.order('published_at desc')
  end
  
end
