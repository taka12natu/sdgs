class ConfirmMailer < ApplicationMailer
	default from: 'notification@example.com'

  def send_confirm(contact)
    @contact = contact
    mail(
      subject: "お問い合わせを受け付けました。",
      to: @contact.email
    )
  end

  def send_confirm_to_admin(contact)
    @contact = contact
    mail(
      subject: "問い合わせ通知",
      to: ENV['ADDRESS']
    )
  end
end