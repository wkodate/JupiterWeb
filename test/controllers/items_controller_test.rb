require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @item = items(:one)
  end

  test "should get index" do
    get items_path
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get new_item_path
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_path, params: { item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    end
    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get item_path(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_path(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_path(@item), params: { id: @item, item: { date: @item.date, description: @item.description, link: @item.link, rss_id: @item.rss_id, title: @item.title } }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_path(@item)
    end
    assert_redirected_to items_path
  end

end
