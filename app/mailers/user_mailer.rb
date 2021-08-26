class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail( to: @user.email, subject: "Welcome to Justice")
  end

  def share(user)
    @user = user
    mail( to: @user.email, subject: "A Report Has Been Shared With You")
  end
end
