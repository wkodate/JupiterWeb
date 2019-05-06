require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def setup
    @rss = Rss.new(
      id: "1",
      rss_url: "http://www.example.rdf",
      title: "example",
      site_link: "http://www.example.com"
    )
    @item = Item.new(
      id: "1",
      link: "http://www.example.com",
      title: "example",
      date: "2016-03-20T22:00:34+09:00",
      image: "http://www.example.jpg",
      rss: @rss
    )
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
