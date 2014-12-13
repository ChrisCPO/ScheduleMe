module ApplicationHelper
  def user_tagline(location)
    if current_user.owner?
      "You are the owner of #{location.name}"
    elsif current_user.manager?
      "You are a manager"
    else
      "You are a #{current_user.role}"
    end
  end
end
