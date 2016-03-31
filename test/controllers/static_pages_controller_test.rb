require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About|なんJまとめのまとめ"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact|なんJまとめのまとめ"
  end

end
