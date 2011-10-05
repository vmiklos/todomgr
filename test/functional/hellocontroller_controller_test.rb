require 'test_helper'

class HellocontrollerControllerTest < ActionController::TestCase
  test "should get hellomethod" do
    get :hellomethod
    assert_response :success
  end

end
