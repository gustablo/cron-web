require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get index' do
    get home_root_url
    assert_response :success
  end

  test 'should redirect to signup when email is blank' do
    post home_lead_opportunity_url, params: { email: '' }
    assert_redirected_to sessions_signup_path
  end

  test 'should redirect to signin if user exists' do
    post home_lead_opportunity_url, params: { email: @user.email }
    assert_redirected_to sessions_signin_path(email: @user.email)
  end

  test 'should redirect to signup if user does not exists' do
    post home_lead_opportunity_url, params: { email: 'not_found_user@example.com' }
    assert_redirected_to sessions_signup_path(email: 'not_found_user@example.com')
  end
end
