class ToppagesController < ApplicationController
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
    if logged_in?
      @my_ecos = current_user.ecos.order(id: :desc).page(params[:page])
      @my_eco = current_user.ecos.build  # form_with用
    end
  end
end
