class LocalUsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = sign_up(user_params)
    location = find_location
    location.users << user

    if user.valid?
      redirect_to location_path(location)
    else
      redirect_to new_location_local_user_path(location)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email).merge!(new_user_password)
  end

  def display_password(password)
    puts "#{password.inspect} <<<<<<<<< NEW PASSWORD"
  end

  def find_location
    Location.find(params[:location_id])
  end

  def new_user_password
    user = User.new
    password = { password: user.build_password }
    display_password(password)
    password
  end
end
