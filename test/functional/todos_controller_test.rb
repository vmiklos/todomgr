require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => todos(:download).id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => todos(:download).id
    assert_response :success
  end

end
