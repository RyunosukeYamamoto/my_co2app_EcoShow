class ToppagesController < ApplicationController
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
    @total_car_distance = car_distance(@kiro)
    
    if logged_in?
      @my_ecos = current_user.ecos.order(id: :desc).page(params[:page])
      @my_total_co2 = @my_ecos.all.sum(:co2)
      @my_kiro = @my_total_co2 / 230
      counts(current_user)
      @my_total_car_distance = car_distance(@my_kiro) # my到達地点の格納
    end
  end
end
