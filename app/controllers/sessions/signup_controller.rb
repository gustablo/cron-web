class Sessions::SignupController < Sessions::BaseController
  def signup
    @user = User.new
    @email_query = params[:email]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to sessions_signin_url
    else
      render action: :signup, status: :unprocessable_entity
    end
  end
end
