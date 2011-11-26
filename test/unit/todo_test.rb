require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "todo is present" do
    t = Todo.new
    assert !t.save, "missing todo accepted"
  end
end
