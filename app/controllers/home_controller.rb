class HomeController < ApplicationController
  def index; end

  def lead_opportunity
    email = lead_params[:email]
    redirect_to sessions_signup_path and return if email.blank?

    user_exists = User.find_by(email: email)

    if user_exists.present?
      redirect_to sessions_signin_path(email: email) and return
    else
      redirect_to sessions_signup_path(email: email) and return
    end
  end

  private

  def lead_params
    params.permit(:email)
  end
end
