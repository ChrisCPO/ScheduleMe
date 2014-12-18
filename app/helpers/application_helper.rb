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

  def zero_to_six
    count = 0
    number = 0
    if count == 0
      count += 1
      number
    else
      count += 1
      number += 1
    end
  end
end
