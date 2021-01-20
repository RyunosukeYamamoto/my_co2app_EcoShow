class EcosController < ApplicationController
  def index
    @ecos = Eco.all
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
    @eco = Eco.find(params[:id])
  end
  
  def update
    @eco = Eco.find(params[:id])
    
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
  
  def eco_params
    params.require(:eco).permit(:action, :co2)
  end
end
