class UserMailer < ApplicationMailer
  
  def user_confirmation(user)
  	@greeting = "Hi"
  	@user = user

  	mail to: @user.email , subject: "Sign up Confirmed"
  end	


end
