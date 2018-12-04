require 'test_helper'
class FoodsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    test "should get contact" do
      get :contact
      assert_response :succes

      assert_template layout: 'application'

      assert_select'title', 'My Notes'
      assert_select'h1', 'Contact Us'
      assert_select'p', 'Complete the following form to get in touch with us.'
end
