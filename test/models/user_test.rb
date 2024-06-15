require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should be valid' do
    invalid_emails = %w[user@example,com user_at_example.org user.name@example. user@example_com]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email should be lowercase' do
    mix_case_email = 'useR1@exAMPle.CoM'
    @user.email = mix_case_email
    @user.save
    assert_equal mix_case_email.downcase, @user.reload.email
  end
end
