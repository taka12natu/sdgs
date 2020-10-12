class ConfirmMailer < ApplicationMailer
	default from: 'notification@example.com'

  def send_confirm(contact)
    @contact = contact
    mail(
      subject: "お問い合わせを受け付けました。",
      to: @contact.email
    )
  end
end