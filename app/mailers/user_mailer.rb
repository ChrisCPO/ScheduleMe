class UserMailer < ActionMailer::Base
  default from: "ScheduleME@example.com"

  def mail_login_info(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: "Your New Account On ScheduleMe")
  end
end
