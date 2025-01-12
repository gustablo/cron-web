class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorized?
    redirect_to sessions_sigin_url, status: :unauthorized unless current_user
  end
end
