require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @todo = todos(:download)
  end

  test "new without login" do
    get :new
    assert_response :redirect
    assert_redirected_to '/todos/show'
  end

  test "new with login" do
    get :new, nil, :user=>users(:me).id
    assert_response :success
  end

  test "create with login" do
    assert_difference('Todo.count') do
      post :create, {todo: @todo.attributes}, {:user=>users(:me).id}
    end
    assert_redirected_to '/todos/show'
    get :show
    assert_select "div#flash_notice", "Todo item successfully added"
  end

  test "create without login" do
    assert_difference('Todo.count',0) do
      post :create, {todo: @todo.attributes}
    end
    assert_redirected_to '/todos/show'
    get :show
    assert_select "div#flash_notice", "Update without login is not allowed"
  end

  test "edit without login" do
    get :edit, :id => todos(:download).id
    assert_response :redirect
    assert_redirected_to '/todos/show'
  end

  test "edit with login" do
    get :edit, {:id => todos(:download).id}, {:user=>users(:me).id}
    assert_response :success
  end

  test "update" do
    put :update, id: @todo.to_param, todo: @todo.attributes
  end

  test "show" do
    get :show, :id => todos(:download).id
    assert_response :success
  end

  test "delete" do
    assert_difference('Todo.count', -1) do
      delete :delete, id: @todo.id
    end
    assert_redirected_to '/todos/show'
  end

end
