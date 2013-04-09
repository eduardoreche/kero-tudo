class ContactMailer < ActionMailer::Base
  default from: "contato@eukerotudo.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us.subject
  #
  def contact_us(name, email, message)
    @name = name
    @email = email
    @message = message
    
    mail subject: 'Contato pelo site'
    mail to: "edu.reche@gmail.com"
    mail from: "contato@eukerotudo.com.br"
  end
end
