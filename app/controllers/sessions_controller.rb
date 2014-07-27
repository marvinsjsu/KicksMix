class SessionsController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user.nil?
      @user = User.new()
      flash.now[:errors] = ["Invalid username/password"]
      render :new
    else
      login_user(@user)
      redirect_to root_url
    end
  end

  def destroy
    logout
  end

end