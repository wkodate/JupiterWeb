require 'test_helper'

class RssTest < ActiveSupport::TestCase
  def setup
    @rss = Rss.new(id: "1", rss_url: "http://www.example.rdf",
      title: "example", site_link: "http://www.example.com", description: "example")
  end

  test "should be valid" do
    assert @rss.valid?
  end

  test "rss url should be present" do
    @rss.rss_url = " "
    assert_not @rss.valid?
  end

  test "title should be present" do
    @rss.title = " "
    assert_not @rss.valid?
  end

  test "site link should be present" do
    @rss.site_link = " "
    assert_not @rss.valid?
  end

end
