require 'test_helper'

class ItemTest < ActionDispatch::IntegrationTest

  def setup
    @item = Item.new(id: "1", link: "http://www.example.com",
      title: "example", description: "example", date: "2016-03-20T22:00:34+09:00", 
      image: "http://www.example.jpg")
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "link should be present" do
    @item.link = " "
    assert_not @item.valid?
  end

  test "title should be present" do
    @item.title = " "
    assert_not @item.valid?
  end

end
