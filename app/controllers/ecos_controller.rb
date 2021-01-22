class EcosController < ApplicationController
  before_action :set_eco, only: [:edit, :update]
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
    if logged_in?
      @my_ecos = current_user.ecos.order(id: :desc).page(params[:page])
      @my_eco = current_user.ecos.build  # form_with用
    end
  end
  
  def new
    @my_eco = Eco.new
  end
  
  def create
    if logged_in?
      @my_eco = current_user.ecos.build(eco_params)
    else
      @my_eco = Eco.new(eco_params)
    end
    
    if @my_eco.save
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
    @my_eco.destroy
    flash[:success] = 'アクションを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_eco
    @eco = Eco.find(params[:id])
  end
  
  def eco_params
    params.require(:eco).permit(:action, :co2)
  end
  
  def correct_user
    @my_eco = current_user.ecos.find_by(id: params[:id])
    unless @my_eco
      redirect_to root_url
    end
  end
end
