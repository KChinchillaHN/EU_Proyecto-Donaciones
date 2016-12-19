class CampaignsController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
  	#  	@campaigns = Campaign.where(:goal <= ).order("created_on DESC")
  	@campaigns = Campaign.order(:created_at)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new  
    @campaign = Campaign.new
  end

  def create
    @user = current_user
    @campaign = @user.campaigns.build(campaign_params)
    @campaign.user = current_user
    if @campaign.save 
      redirect_to campaigns_path, notice: "La Campaña se agrego exitosamente" 
    else
      flash[:error] = "No se pudo registrar el libro, Favor corregir los siguientes errores: "
      render :new
    end
  end

  def category_1
  	@campaigns = Campaign.order(:created_at)
  end

  def category_2
  	@campaigns = Campaign.order(:created_at)	
  end

  def category_3
  	@campaigns = Campaign.order(:created_at)
  end

  def category_4
  	@campaigns = Campaign.order(:created_at)
  end

  def category_5
  	@campaigns = Campaign.order(:created_at)
  end

  protected
  def campaign_params
    params.require(:campaign).permit(:title, :description, :review, :goal, :category, :image_url, :end_date)
  end

end
