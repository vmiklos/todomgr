require 'test_helper'

class TodoSubmissionTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "todo submission" do
    get url_for(:controller=>"todos", :action=>"new")
    assert_response :redirect
    assert_redirected_to "/todos/show"

    post_via_redirect '/session/create',
      {:username => users(:me).username,
        :password => 'titok'},
      {"HTTP_REFERER" => '/todos/show'}
    assert_equal path, '/todos/show'
    assert_not_nil session[:user]
    assert_equal session[:user], users(:me).id

    get url_for(:controller=>"todos", :action=>"new")
    assert_response :success
    assert_select "a", "Submit todo item"

    post url_for(:controller=>"session", :action=>"destroy"),
      nil,
      {"HTTP_REFERER" => '/todos/show'}
    assert_response :redirect
    assert_nil session[:user]
  end
end
