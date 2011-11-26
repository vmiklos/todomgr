require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username is present" do
    u = User.new
    assert !u.save, "missing username accepted"
  end

  test "username is unique" do
    u = User.new
    u.username = "foobar"
    assert u.save

    v = User.new
    v.username = "foobar"
    assert !v.save, "non-unique username accepted"
  end

  test "username length is within a range" do
    u = User.new
    u.username = "a"
    assert !u.save

    u.username = "asdfasdfasdfasdfasdfa"
    assert !u.save
  end
end
