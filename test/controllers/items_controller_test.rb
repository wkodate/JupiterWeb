require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @item = items(:one)
    @admin_user = users(:michael)
    @not_admin = users(:archer)
  end

  test "should get index" do
    log_in_as(@admin_user)
    get items_path
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    log_in_as(@admin_user)
    get new_item_path
    assert_response :success
  end

  test "should create item" do
    log_in_as(@admin_user)
    assert_difference('Item.count') do
      post items_path, params: { item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    end
    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    log_in_as(@admin_user)
    get item_path(@item)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@admin_user)
    get edit_item_path(@item)
    assert_response :success
  end

  test "should update item" do
    log_in_as(@admin_user)
    patch item_path(@item), params: { id: @item, item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    log_in_as(@admin_user)
    assert_difference('Item.count', -1) do
      delete item_path(@item)
    end
    assert_redirected_to items_path
  end

  test "should not redirect index when not loggined in" do
    get items_path
    assert_response :success
  end

  test "should get new when not loggined in" do
    get new_item_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_item_path(@item)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch item_path(@item), params: { item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Item.count' do
      delete item_path(@item)
    end
    assert_redirected_to login_url
  end

  test "should redirect new when logged in as wrong user" do
    log_in_as(@not_admin)
    get new_item_path
    assert flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@not_admin)
    get edit_item_path(@item)
    assert flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@not_admin)
    patch item_path(@item), params: { item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    assert flash.empty?
    assert_redirected_to login_url
  end

end
