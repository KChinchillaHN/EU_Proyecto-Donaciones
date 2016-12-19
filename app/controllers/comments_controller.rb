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
  		redirect_to @campaign
  	else
  		render :new
  	end
  end

  def comment_params
  	params.require(:comment).permit(:author, :message)
  end
end
