class Api::UsersController < ApplicationController
  before_action :require_current_user!

  def show
    @user = get_current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      redirect_to user_url(user)
    else
       @user.errors.full_messages
    end
  end

  def update
    @user = User.find(params[:id])

    #if get_current_user role is "admin"
    #@user = User.find(params[:id])
    #else
    #@user = get_current_user

    if @user.update_attributes(user_params)
      @user
    else
      @user.errors.full_messages
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :description, :photo_url, :photo_url_file_name, :photo_url_content_type, :photo_url_file_size)
  end
end