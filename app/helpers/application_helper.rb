module ApplicationHelper
  def current_user_has_location?
    current_user.location
  end
end
