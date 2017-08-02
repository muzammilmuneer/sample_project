class NewOrderMailer < ApplicationMailer
  default from: 'restaurant@system.com'
  def send_email_to_admin(user)
    @user = user
    # I am overriding the 'to' default
    mail(to: @user.email, subject: 'New Order')
  end
end
