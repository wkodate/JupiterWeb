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

  test "should get new" do
    get new_rss_path
    assert_response :success
  end

  test "should create rss" do
    assert_difference('Rss.count') do
      post rsses_path, params: { rss: { site_link: @rss.site_link, description: @rss.description, rss_url: @rss.rss_url, title: @rss.title } }
    end
    assert_redirected_to rsses_url
  end

  test "should show rss" do
    get rss_path(@rss)
    assert_response :success
  end

  test "should get edit" do
    get edit_rss_path(@rss)
    assert_response :success
  end

  test "should update rss" do
    patch rss_path(@rss), params: { rss: { site_link: @rss.site_link, description: @rss.description, rss_url: @rss.rss_url, title: @rss.title } }
    assert_redirected_to rss_path(assigns(:rss))
  end

  test "should destroy rss" do
    assert_difference('Rss.count', -1) do
      delete rss_path(@rss)
    end
    assert_redirected_to rsses_url
  end

end
