require 'test_helper'
class FoodsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
    test "should get contact" do
      get contact_path
      assert_response :succes

      assert_template layout: 'application'

      assert_select'title', 'My Notes'
      assert_select'h1', 'Contact Us'
      assert_select'p', 'Complete the following form to get in touch with us.'
    end

    test "should post request contact but no email" do
      post request_contact_path  #if it doesnt work try _url not _path

      assert_response :redirect
      assert_not_empty flash[:alert]
      assert_nil flash[:notice]
    end

    test "should post request contact" do
      post request_contact_path,#if it doesnt work try _url not _path
        name: "Mohammad",email: "khan@me.co.uk",telephone: "1234567890",message: "Hello"

      assert_response :redirect
      assert_nil flash[:alert]
      assert_not_empty flash[:notice]
    end

end
