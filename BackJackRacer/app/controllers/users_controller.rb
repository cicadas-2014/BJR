class UsersController < ApplicationController

  def index
    @error = params[:error]
    redirect_to new_round_path if session[:user_id]
  end

  def create
    user_params = params[:user]
    user = User.new(username: user_params[:username], password: user_params[:password])
    if user.save
      session[:user_id] = user.id
      redirect_to new_round_path
    else
      render :index
    end
  end

  def signin
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to new_round_path
    else
      @error = "Invalid login"
      render :index
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
