class UserMailer < ActionMailer::Base
  default from: "czupaczupsowy@gmail.com"

  def test_mail(email_address)
    @mail = email_address
    mail(to: email_address, subcject: 'Same świetne wiadomości')
  end
end
