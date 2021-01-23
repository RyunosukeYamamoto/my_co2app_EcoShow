class ToppagesController < ApplicationController
  before_action :require_user_logged_in, only: [:my_index]
  
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
    @total_car_distance = car_distance(@kiro)
  end
  
  def my_index
    @my_ecos = current_user.ecos.order(id: :desc).page(params[:page])
    @my_total_co2 = @my_ecos.all.sum(:co2)
    @my_kiro = @my_total_co2 / 230
    counts(current_user)
    car_distance(@my_kiro) # my到達地点の格納
  end
end
