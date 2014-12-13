class LocalUsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_manager, only: [:new, :create]

  def new
    @location = find_location
    @user = User.new
  end

  def create
    user = sign_up(user_params)
    user.location = find_location

    if user.save
      password = PasswordReset.create(user: user)
      UserMailer.mail_login_info(user, password).deliver
      redirect_to user.location
    else
      @location = user.location
      @user = user
      render :new
    end
  end

  def index
    @location = find_location
  end

  private

  attr_accessor :password

  def user_params
    params.
      require(:user).
      permit(:username, :email).
      merge(get_password)
  end

  def get_password
    @password = User.new_password
  end

  def find_location
    Location.find(params[:location_id])
  end
end
