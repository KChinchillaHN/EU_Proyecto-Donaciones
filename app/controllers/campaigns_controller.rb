class CampaignsController < ApplicationController
  skip_before_action :authenticate, only: [:index, :category_1]
  def index
  	#@campaigns = Campaign.where(:goal <= Campaign.sum_of_donations).order("created_on DESC")
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
      UserMailer.new_campaign_notification(@user, @campaign).deliver
      redirect_to campaigns_path, notice: "La Campaña se agrego exitosamente" 
    else
      flash[:error] = "No se pudo registrar la campaña, Favor corregir los siguientes errores: "
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaigns_path, notice: "La campaña se actualizo correctamente."
    else
      render :edit
    end
  end

  def category_1
  	@campaigns = Campaign.where(category: 'Medica')
  end

  def category_2
  	@campaigns = Campaign.where(category: 'Deportes')	
  end

  def category_3
  	@campaigns = Campaign.where(category: 'Animales')  
  end

  def category_4
  	@campaigns = Campaign.where(category: 'Negocios')  
  end

  def category_5
  	@campaigns = Campaign.where(category: 'Caridad')  
  end

  protected
  def campaign_params
    params.require(:campaign).permit(:title, :description, :review, :goal, :category, :image_url, :end_date)
  end

end
