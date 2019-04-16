require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @title = "なんJまとめのまとめ"
  end
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@title}"
  end

end
