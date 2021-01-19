class UserMailer < ApplicationMailer
  def user_created(user)
    @greeting = "Hi"
    @user = user
    mail to:  @user.email, subject: "welcome to DeviseJWT"	
  end  
end
