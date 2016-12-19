class CommentsController < ApplicationController
  def new
  	@campaign = Campaign.find(params[:campaign_id])
  	@comment = @campaign.comments.build
  end

  def create
  	@campaign = Campaign.find(params[:campaign_id])
  	@comment = @campaign.comments.build(comment_params)
  	@campaign.user = current_user
    @user = current_user
    if @comment.save
      UserMailer.new_comment_notification(@user, @comment, @campaign).deliver
  		redirect_to @campaign
  	else
  		render :new
  	end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to campaigns_path
  end

  def comment_params
  	params.require(:comment).permit(:author, :message)
  end
end
