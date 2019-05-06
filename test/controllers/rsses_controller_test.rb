require 'test_helper'

class RssesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @rss = rsses(:rss1)
  end

  test "should get index" do
    get rsses_path
    assert_response :success
    assert_not_nil assigns(:rsses)
  end

end
