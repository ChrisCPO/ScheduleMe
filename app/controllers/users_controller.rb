class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)

    if @user.valid?
      redirect_to dashboard_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
                                  :email,
                                  :password,
                                  :username
                                )
  end

  def update_params
    if current_user.manager?
      params.require(:user).permit(
                                   :email,
                                   :username,
                                   :role
                                  ).update(update_role_to_i)
    else
      params.require(:user).permit(:email, :username)
    end
  end

  def update_role_to_i
    { role: params[:user][:role].to_i }
  end
end
