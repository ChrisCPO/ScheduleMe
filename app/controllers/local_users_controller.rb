class LocalUsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_owner, only: [:new, :create]

  def new
    @location = find_location
    @user = User.new
  end

  def create
    user = sign_up(user_params)
    user.location = find_location

    if user.valid?
      redirect_to user.location
    else
      redirect_to new_location_local_user_path(location)
    end
  end

  private

  def user_params
    params.
      require(:user).
      permit(:username, :email).
      merge(User.new_password)
  end

  def find_location
    Location.find(params[:location_id])
  end
end
