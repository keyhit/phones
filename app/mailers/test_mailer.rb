class TestMailer < ApplicationMailer
  def test
    mail(to: 'viacheslavkarpenkoju@gmail.com', subject: 'Test mailer')
  end
end
