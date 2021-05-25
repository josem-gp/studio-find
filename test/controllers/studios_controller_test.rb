require 'test_helper'

class StudiosControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get studios_index_url
    assert_response :success
  end
end
