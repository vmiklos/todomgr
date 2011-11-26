require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @request.env["HTTP_REFERER"]='/todos/show'
    @user = User.new
    @user.username = 'newuser'
    @user.email = 'a@b.c'
  end

  test "create with login" do
    assert_difference('User.count',0) do
      post :create, {user: @user.attributes}, {:user=>users(:me).id}
    end
    assert_response :redirect
    assert_not_nil session[:user]
    get :edit, :id => users(:me).id
    assert_select "div#flash_notice", "Already registered"
  end

  test "create without login" do
    assert_difference('User.count') do
      post :create, user: @user.attributes
    end
    assert_response :redirect
    assert_not_nil session[:user]
    get :edit, :id => users(:me).id
    assert_select "div#flash_notice", "Successfull registration"
  end

  test "should get show" do
    get :edit, :id => users(:me).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:me).id
    assert_response :success
  end

  test "should get forgotten" do
    get :edit, :id => users(:me).id
    assert_response :success
  end

end
