require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  setup do
    @request.env["HTTP_REFERER"]='/todos/show'
  end
  test "login" do
    post :create,
      {:username => users(:me).username, :password => 'titok'}
    assert_response :redirect
    assert_not_nil session[:user]
    assert_equal session[:user], users(:me).id
  end

  test "failed login" do
    post :create,
      {:username => users(:me).username, :password => 'br0ken'}
    assert_response :redirect
    assert_nil session[:user]
  end

  test "logout" do
    post :destroy, nil, {:user => users(:me).id}
    assert_response :redirect
    assert_nil session[:user]
  end
end
