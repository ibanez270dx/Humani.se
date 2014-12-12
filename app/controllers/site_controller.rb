# A controller for all the static pages

class SiteController < ApplicationController

  def about
  end

  def channel
    render layout: false
  end

end
