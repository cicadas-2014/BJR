class UsersController < ApplicationController

  def index

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
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to new_round_path
      end
    else
      @error = "Invalid login"
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
