class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to cookies[:path] || tests_path
      cookies.delete(:path)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
