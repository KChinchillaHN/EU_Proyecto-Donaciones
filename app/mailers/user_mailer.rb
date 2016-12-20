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

  def new_campaign_notification(user, campaign)
    @user = user
    @campaign = campaign
    mail(to: @user.email, subject: 'Se ha creado una campaña')
  end

  def edit_campaign_notification(user, campaign)
    @user = user
    @campaign = campaign
    mail(to: @user.email, subject: 'Han efectuado una donacion en tu campaña')
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a la Familia #makeithappenhn')
  end
end
