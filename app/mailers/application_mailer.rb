class ApplicationMailer < ActionMailer::Base

  # defines all properties and is a superclass for all mailers
  default from: 'from@example.com'
  layout 'mailer'
end
