require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    log_in_as(@user)
  end

  test 'should get index' do
    get admin_dashboard_url
    assert_response :success
  end

  # test 'should redirect to signin if not authenticated' do
  #   log_out
  #   get admin_dashboard_url
  #   assert_redirected_to sessions_sigin_url, status: :unauthorized
  # end
end
