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

  test "should show item" do
    get items_path(@item)
    assert_response :success
  end

end
