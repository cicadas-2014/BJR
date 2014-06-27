class UsersController < ApplicationController

  def index
    
  end

  def new
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect_to new_round_path
    else
      render :index
    end
  end

  def signin
    @user = User.find(email: params[:email])
    if @user.authenticate(params[:password])
      redirect_to new_round_path
    else
      render :index
    end
  end

end
