class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_manager
    unless current_user.manager?
      redirect_to :back
    end
  end

  def user_no_location
    unless current_user.location?
      redirect_to :back
    end
  end
end
