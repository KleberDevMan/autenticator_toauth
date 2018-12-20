require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get index_sign_up_url
    assert_response :success
  end

end
