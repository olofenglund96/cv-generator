require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Arvid Mildner", email: "bulle@gmail.com")
  end

  #Make sure you include this as save action is performed which will invalidate uniqueness later on.
  def teardown
    @user.destroy
  end
  
  test "Should be valid" do
  
    assert @user.valid?, @user.errors.full_messages
  end

  test "Name should be present" do
    @user.name = ''
    assert_not @user.valid?
  end

  test "Email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com, user@example..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email adresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
 
end
