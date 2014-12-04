class LocalUsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = sign_up(user_params)
    location = Location.find(params[:location_id])
    location.users << user

    if user.valid?
      redirect_to location_path(location)
    end
  end

  private

  def user_params
    user = User.new
    password = {password: user.build_password}
    display_password(password)
    params.require(:user).permit(:username, :email ).merge!(password)
  end

  def display_password(password)
    puts "#{password.inspect} <<<<<<<<< NEW PASSWORD"
  end
end
