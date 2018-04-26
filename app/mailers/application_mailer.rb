class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def test(email)
    mail(to: email, subject: 'test')
  end
end


