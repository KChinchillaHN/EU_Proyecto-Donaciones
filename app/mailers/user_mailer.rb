class UserMailer < ActionMailer::Base
	default from: 'makeithappenhn@hotmail.com'
	def new_comment_notification(user, comment, campaign)
    @user = user
    @comment = comment
    @campaign = campaign
    mail(to: @user.email, subject: 'Han efectuado un comentario en tu campaña')
  end
  
  def new_donation_notification(user, donation, campaign)
    @user = user
    @donation = donation
    @campaign = campaign
    mail(to: @user.email, subject: 'Han efectuado una donacion en tu campaña')
  end
end
