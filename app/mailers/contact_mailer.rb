class ContactMailer < ApplicationMailer

  # used to send an email
  def contact_email(email, name, telephone, message)
    @email = email
    @name = name
    @telephone = telephone
    @message = message

    mail cc: @email

  end

end
