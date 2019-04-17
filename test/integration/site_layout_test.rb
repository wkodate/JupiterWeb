require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get about_path
    assert_template 'static_pages/about'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", "https://twitter.com/matome_nanj"
  end

end
