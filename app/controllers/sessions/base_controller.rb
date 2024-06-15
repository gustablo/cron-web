class Sessions::BaseController < ApplicationController
  before_action :reset_session

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
