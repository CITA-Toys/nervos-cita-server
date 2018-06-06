class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAIL_USERNAME') { 'noreply@cryptape.com' }
  layout 'mailer'
end
