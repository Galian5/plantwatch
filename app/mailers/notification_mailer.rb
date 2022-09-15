class NotificationMailer < ActionMailer::Base
  default from: 'notifications@plantwatch.com'

  def notification_mail
    @user = params[:user]
    @plant = params[:plant]
    @measurement = params[:measurement]
    mail(to: @user.email,
         subject: "Check on your #{ @plant }",
         template_path: 'notification_mailer',
         template_name: 'notification_mail')
  end
end
