class UsersController < ApplicationController

  def index

  end

  def new
    user_params = params[:user]
    @user = User.new(username: user_params[:username], password: user_params[:password])
    if @user.save
      redirect_to new_round_path
    else
      p "Failure to sign up"
      render :index
    end
  end

  def signin
    @user = User.find(username: params[:username])
    p params
    if @user.authenticate(params[:password])
      redirect_to new_round_path
    else
      p "Failure to log in"
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
