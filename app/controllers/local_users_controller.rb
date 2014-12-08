class LocalUsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_owner, only: [:new, :create]

  def new
    @location = find_location
    @user = User.new
  end

  def create
    @user = User.new
    @location = find_location
    user = sign_up(user_params)
    user.location = find_location

    if user.save
       redirect_to user.location
    else
      render :new
    end
  end

  def index
    location = find_location
    @users = User.where(location_id: location.id)
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
