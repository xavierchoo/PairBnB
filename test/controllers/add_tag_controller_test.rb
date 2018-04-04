require 'test_helper'

class AddTagControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get add_tag_show_url
    assert_response :success
  end

end
