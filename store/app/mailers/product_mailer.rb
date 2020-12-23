class ProductMailer < ApplicationMailer
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.product_created.subject
  #
  def product_created(product)
    @greeting = "Hi"
    @product = product

    mail to: "kanishkakumar408@gmail.com" , subject: "product created successfully" 
  end
end
