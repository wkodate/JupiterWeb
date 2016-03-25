require 'test_helper'

class RssesControllerTest < ActionController::TestCase

  def setup
    @rss = rsses(:rss1)
    @admin_user = users(:michael)
    @not_admin = users(:archer)
  end

  test "should get index" do
    log_in_as(@admin_user)
    get :index
    assert_response :success
    assert_not_nil assigns(:rsses)
  end

  test "should get new" do
    log_in_as(@admin_user)
    get :new
    assert_response :success
  end

  test "should create rss" do
    log_in_as(@admin_user)
    assert_difference('Rss.count') do
      post :create, rss: { site_link: @rss.site_link, description: @rss.description, rss_url: @rss.rss_url, title: @rss.title }
    end
    assert_redirected_to rsses_url
  end

  test "should show rss" do
    log_in_as(@admin_user)
    get :show, id: @rss
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin_user)
    get :edit, id: @rss
    assert_response :success
  end

  test "should update rss" do
    log_in_as(@admin_user)
    patch :update, id: @rss, rss: { site_link: @rss.site_link, description: @rss.description, rss_url: @rss.rss_url, title: @rss.title }
    assert_redirected_to rss_path(assigns(:rss))
  end

  test "should destroy rss" do
    log_in_as(@admin_user)
    assert_difference('Rss.count', -1) do
      delete :destroy, id: @rss
    end
    assert_redirected_to rsses_url
  end

  test "should redirect index when not loggined in" do
    get :index
    assert_redirected_to login_url
  end

  test "should get new when not loggined in" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @rss
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @rss, rss: { rss_url: @rss.rss_url, title: @rss.title, site_link: @rss.site_link}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Rss.count' do
      delete :destroy, id: @rss
    end
    assert_redirected_to login_url
  end

  test "should redirect new when logged in as wrong user" do
    log_in_as(@not_admin)
    get :new
    assert flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@not_admin)
    get :edit, id: @rss
    assert flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@not_admin)
    patch :update, id: @rss, rss: { rss_url: @rss.rss_url, title: @rss.title, site_link: @rss.site_link}
    assert flash.empty?
    assert_redirected_to login_url
  end

end
