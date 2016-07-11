require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be vaild" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "eamil should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid address" do
    valid_address = %w[user@example.com]
    valid_address.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "email address must be unique" do
    dp_user = @user.dup
    dp_user.email = @user.email.upcase
    @user.save
    assert_not dp_user.valid?
  end

  test "password should not be too short" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
