class SendToUsers < ApplicationMailer
  def invitation(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Accountancy 2016 Year Book' )
  end

  def volunteer(user)
    @user = user
    mail( :to => 'dshahn.2012@accountancy.smu.edu.sg',
      :subject => 'Someone volunteered')
  end
end