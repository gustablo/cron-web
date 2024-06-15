class Sessions::SigninController < Sessions::BaseController
  def signin
    @user = User.new
    @email_query = params[:email]
  end

  def authenticate
    @user = User.find_by(email: user_params[:email].downcase)

    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to admin_dashboard_url
    else
      render action: :signin, status: :unauthorized
    end
  end
end
