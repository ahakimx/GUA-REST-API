class UserMailer < ApplicationMailer
    default from: "skyccrfxcyr@gmail.com"

    def create_user(user, password)
        @user = user
        @password = password
        mail(to: @user.email, subject: 'Welcome to GUA Insurance')
    end

   def request_forget_password_user(user, password)
        @user = user
        @password = password
        mail(to: @user.email, subject: 'Request Forget Password')
    end
end
