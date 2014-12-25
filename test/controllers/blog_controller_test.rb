require 'test_helper'

class BlogControllerTest < ActionController::TestCase

  test "Blog Index" do
    get :index
    assert_response :success
  end

  test "Blog Show" do
    Post.all.each do |post|
      get :show, url_title: post.url_title
      assert_response :success
    end
  end

end
