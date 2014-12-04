class LocalUsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    user = sign_up(user_params)
    location = find_location
    location.add_user(user)

    if user.valid?
      redirect_to location_path(location)
    else
      redirect_to new_location_local_user_path(location)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email).merge(new_user_password)
  end

  def find_location
    Location.find(params[:location_id])
  end

  def new_user_password
    user = User.new
    password = { password: user.build_password }
    password
  end
end
