class ProductMailer < ApplicationMailer
  default from: "from@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.product_created.subject
  #
  def product_created
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
