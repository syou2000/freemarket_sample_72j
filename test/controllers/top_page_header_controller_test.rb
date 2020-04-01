require 'test_helper'

class TopPageHeaderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_page_header_index_url
    assert_response :success
  end

end
