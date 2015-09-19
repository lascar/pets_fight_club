class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://pascal.com/login'
    mail(to: @user.email, subject: 'Bienvenido/a en el Robots Fight Club site')
  end
end
