require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "なんJまとめのまとめ"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "なんJまとめのまとめ"
  end

end
