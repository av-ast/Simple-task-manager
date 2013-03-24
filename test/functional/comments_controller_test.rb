require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @admin = users(:admin)
    @editor = users(:editor)
    @operator = users(:operator)
  end

  test "guest can not create comment" do
    post :create, :comment => @comment.attributes
    assert_redirected_to login_url
  end

  test "guest can not delete comment" do
    delete :destroy, :id => @comment
    assert_redirected_to login_url
  end

  test "should create comment" do
    session["user_id"] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    assert_difference('Comment.count') do
      post :create, :comment => @comment.attributes
    end

    assert_redirected_to "/test_url"
  end

  test "should destroy comment" do
    session["user_id"] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    assert_difference('Comment.count', -1) do
      delete :destroy, :id => @comment
    end

    assert_redirected_to "/test_url"
  end
end
