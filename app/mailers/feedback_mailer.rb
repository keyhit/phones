class FeedbackMailer < ApplicationMailer
  default from: 'example@gmail.com'
  layout 'mailer'
  def feedback(subject, body, message_sender, file_name, file_path)
    @subject = subject
    @body = body
    @file_path = file_path
    @file_name = file_name
    @message_sender = message_sender
    attachments.inline[@file_name] = File.read(@file_path)
    mail(to: 'viacheslavkarpenkoju@gmail.com', subject: @subject)
  end
end
