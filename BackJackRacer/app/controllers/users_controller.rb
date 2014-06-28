class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect_to new_round_path
    else
      p "Failure to sign up"
      render :index
    end
  end

  def signin
    @user = User.find(email: params[:email])
    if @user.authenticate(params[:password])
      redirect_to new_round_path
    else
      p "Failure to log in"
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
