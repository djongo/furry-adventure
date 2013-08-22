class UserMailer < ActionMailer::Base
  default from: "puma@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email, :subject => "Your password has been reset" )
  end

  def activation_needed_email(user)
    @user = user
    @url = 'http://0.0.0.0:3000/users/#{user.activation_token}/activate'
    mail(:to => user.email, :subject => "Welcome to PUMA, HBSC Publication Management")
  end

  def activation_sucess_email(user)
    @user = user
    @url = 'http://0.0.0.0:3000/login'
    mail(:to => user.email, :subject => "Your account is now activated")   
  end

end
