require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
    @editor = users(:editor)
    @operator = users(:operator)
    @user = users(:test)
  end

  test "guest can not get index" do
    get :index
    assert_redirected_to login_url
  end

  test "operator can get index" do
    session["user_id"] = @operator
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "editor can get index" do
    session["user_id"] = @editor
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "admin can get index" do
    session["user_id"] = @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
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

  test "editor can not get new" do
    session[:user_id] = @editor
    request.env["HTTP_REFERER"] = "/test_url"
    get :new
    assert_redirected_to "/test_url"
  end

  test "admin can get new" do
    session[:user_id] = @admin
    get :new
    assert_response :success    
  end

## create

  test "guest can not create user" do
    post :create, :user => @user.attributes
    assert_redirected_to login_url
  end

  test "operator can not create user" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    post :create, :user => @user.attributes
    assert_redirected_to "/test_url"
  end

  test "editor can not create user" do
    session[:user_id] = @editor
    request.env["HTTP_REFERER"] = "/test_url"
    post :create, :user => @user.attributes
    assert_redirected_to "/test_url"
  end

  test "admin can create user" do
    session[:user_id] = @admin
    assert_difference('User.count') do
      post :create, :user => { "email" => "test2@test.ru", "name" => "Test2", "role" => "operator", "password" => "1", "password_confirmation" => "1" }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "admin could not create user" do
    session[:user_id] = @admin
    assert_difference('User.count', 0) do
      post :create, :user => { "id" => "2312312", "email" => "test2@test.ru", "name" => "Test2", "role" => "operator", "password" => "1", "password_confirmation" => "wrong confirmation" }
    end

    assert_response :success
    assert_template :new
  end

## show

  test "guest can not see user" do
    get :show, :id => @user
    assert_redirected_to login_url
  end

  test "operator can see user" do
    session[:user_id] = @operator
    get :show, :id => @user
    assert_response :success
  end

  test "editor can see user" do
    session[:user_id] = @editor
    get :show, :id => @user
    assert_response :success
  end

  test "admin can see user" do
    session[:user_id] = @admin
    get :show, :id => @user
    assert_response :success
  end

## edit

  test "guest can not get edit" do
    get :edit, :id => @user
    assert_redirected_to login_url
  end

  test "operator can not get edit" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    get :edit, :id => @user
    assert_redirected_to "/test_url"
  end

  test "editor can not get edit" do
    session[:user_id] = @editor
    request.env["HTTP_REFERER"] = "/test_url"
    get :edit, :id => @user
    assert_redirected_to "/test_url"
  end

  test "admin can get edit" do
    session[:user_id] = @admin
    get :edit, :id => @user
    assert_response :success
  end

## update

  test "guest can not update user" do
    put :update, :id => @user, :user => @user.attributes
    assert_redirected_to login_url
  end

  test "operator can not update user" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    put :update, :id => @user, :user => @user.attributes
    assert_redirected_to "/test_url"
  end

  test "editor can not update user" do
    session[:user_id] = @editor
    request.env["HTTP_REFERER"] = "/test_url"
    put :update, :id => @user, :user => @user.attributes
    assert_redirected_to "/test_url"
  end

  test "admin can update user" do
    session[:user_id] = @admin
    put :update, :id => @user, :user => { "id" => "2312312", "email" => "test2@test.ru", "name" => "Test2", "role" => "operator", "password" => "1", "password_confirmation" => "1" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "admin can not update user" do
    session[:user_id] = @admin
    put :update, :id => @user, :user => { "id" => "2312312", "email" => "test2@test.ru", "name" => "Test2", "role" => "operator", "password" => "1", "password_confirmation" => "wrong password" }
    assert_response :success
    assert_template :edit
  end

## destroy

  test "guest can not destroy user" do
    delete :destroy, :id => @user
    assert_redirected_to login_url
  end

  test "operator can not destroy user" do
    session[:user_id] = @operator
    request.env["HTTP_REFERER"] = "/test_url"
    delete :destroy, :id => @user
    assert_redirected_to "/test_url"
  end

  test "editor can not destroy user" do
    session[:user_id] = @editor
    request.env["HTTP_REFERER"] = "/test_url"
    delete :destroy, :id => @user
    assert_redirected_to "/test_url"
  end

  test "admin can destroy user" do
    session[:user_id] = @admin
    assert_difference('User.count', -1) do
      delete :destroy, :id => @user
    end

    assert_redirected_to users_path
  end
end
