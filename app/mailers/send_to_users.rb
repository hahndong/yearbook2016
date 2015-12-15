class SendToUsers < ApplicationMailer
  def invitation(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Accountancy 2016 Year Book' )
  end
end