class Notifier < ActionMailer::Base
  default from: 'no-reply@glafir.ru',
          return_path: 'glafir@ya.ru'

  def welcome(recipient)
    @account = recipient
    mail(to: recipient.email_address_with_name,
         bcc: ["glafir@ya.ru", "Order Watcher <glafir@glafir.ru>"])
  end
end
