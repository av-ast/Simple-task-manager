require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @story = stories(:one)
    @admin = users(:admin)
    @editor = users(:editor)
    @operator = users(:operator)
  end

  test "guest can not get index" do
    get :index
    assert_redirected_to login_url
  end

  test "operator can get index" do
    session["user_id"] = @operator
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "editor can get index" do
    session["user_id"] = @editor
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "admin can get index" do
    session["user_id"] = @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

## new

  test "guest can not get new" do
    get :new
    assert_redirected_to login_url
  end

  test "operator can not get new" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    get :new
    assert_redirected_to "/test_url"
  end

  test "editor can get new" do
    session[:user_id] = @editor
    get :new
    assert_response :success    
  end

  test "admin can get new" do
    session[:user_id] = @admin
    get :new
    assert_response :success    
  end

## create

  test "guest can not create story" do
    post :create, :story => @story.attributes
    assert_redirected_to login_url
  end

  test "operator can not create story" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    post :create, :story => @story.attributes
    assert_redirected_to "/test_url"
  end

  test "editor can create story" do
    session[:user_id] = @editor
    assert_difference('Story.count') do
      post :create, :story => @story.attributes
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "admin can create story" do
    session[:user_id] = @admin
    assert_difference('Story.count') do
      post :create, :story => @story.attributes
    end

    assert_redirected_to story_path(assigns(:story))
  end

## show

  test "guest can not see story" do
    get :show, :id => @story
    assert_redirected_to login_url
  end

  test "operator can see story" do
    session[:user_id] = @operator
    get :show, :id => @story
    assert_response :success
  end

  test "editor can see story" do
    session[:user_id] = @editor
    get :show, :id => @story
    assert_response :success
  end

  test "admin can see story" do
    session[:user_id] = @admin
    get :show, :id => @story
    assert_response :success
  end

## edit

  test "guest can not get edit" do
    get :edit, :id => @story
    assert_redirected_to login_url
  end

  test "operator can not get edit" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    get :edit, :id => @story
    assert_redirected_to "/test_url"
  end

  test "editor can get edit" do
    session[:user_id] = @editor
    get :edit, :id => @story
    assert_response :success
  end

  test "admin can get edit" do
    session[:user_id] = @admin
    get :edit, :id => @story
    assert_response :success
  end

## update

  test "guest can not update story" do
    put :update, :id => @story, :story => @story.attributes
    assert_redirected_to login_url
  end

  test "operator can not update story" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    put :update, :id => @story, :story => @story.attributes
    assert_redirected_to "/test_url"
  end

  test "editor can update story" do
    session[:user_id] = @editor
    put :update, :id => @story, :story => @story.attributes
    assert_redirected_to story_path(assigns(:story))
  end

  test "admin can update story" do
    session[:user_id] = @admin
    put :update, :id => @story, :story => @story.attributes
    assert_redirected_to story_path(assigns(:story))
  end

## destroy

  test "guest can not destroy story" do
    delete :destroy, :id => @story
    assert_redirected_to login_url
  end

  test "operator can not destroy story" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    delete :destroy, :id => @story
    assert_redirected_to "/test_url"
  end

  test "editor can destroy story" do
    session[:user_id] = @editor
    assert_difference('Story.count', -1) do
      delete :destroy, :id => @story
    end

    assert_redirected_to stories_path
  end

  test "admin can destroy story" do
    session[:user_id] = @admin
    assert_difference('Story.count', -1) do
      delete :destroy, :id => @story
    end

    assert_redirected_to stories_path
  end
end
