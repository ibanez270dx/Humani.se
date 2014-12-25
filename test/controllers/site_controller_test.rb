require 'test_helper'

class SiteControllerTest < ActionController::TestCase

  test "About Page" do
    get :about
    assert_response :success
  end

  test "Facebook Channel" do
    get :channel
    assert_response :success
  end
end
