require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "client login ok" do
    auth = {"email" => @admin.email, "password" => "1"}
    post :create, auth
    assert_redirected_to root_url
    assert_equal @admin.id, session["user_id"]
  end

  test "client login failed" do
    auth = {"email" => @admin.email, "password" => "wrong pass"}
    post :create, auth
    assert_response :success
    assert_nil session["user_id"]
    assert_equal "Invalid email or password", flash[:alert]
  end

  test "client logout" do
    session["user_id"] = 1
    get :destroy
    assert_redirected_to root_url
    assert_nil session["user_id"]
  end

end
