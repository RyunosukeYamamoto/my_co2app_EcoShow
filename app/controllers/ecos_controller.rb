class EcosController < ApplicationController
  before_action :set_eco, only: [:edit, :update]
  
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
  end
  
  def new
    @eco = Eco.new
  end
  
  def create
    @eco = Eco.new(eco_params)
    
    if @eco.save
      flash[:success] = 'エコアクションが正常に投稿されました'
      redirect_to ecos_url
    else
      flash.now[:danger] = 'エコアクションが投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @eco.update(eco_params)
      flash[:success] = 'エコアクションは正常に更新されました'
      redirect_to ecos_url
    else
      flash.now[:danger] = 'エコアクションは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
  def set_eco
    @eco = Eco.find(params[:id])
  end
  
  def eco_params
    params.require(:eco).permit(:action, :co2)
  end
end
