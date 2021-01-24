class ToppagesController < ApplicationController
  include ToppagesHelper
  
  before_action :require_user_logged_in, only: [:my_index]
  
  def index
    @ecos = Eco.order(id: :desc).page(params[:page]).per(15)
    @total_co2 = Eco.all.sum(:co2)
    @kiro = @total_co2 / 230
    car_distance(@kiro)
  end
  
  def my_index
    @my_ecos = current_user.ecos.order(id: :desc).page(params[:page])
    @my_total_co2 = @my_ecos.all.sum(:co2)
    @my_kiro = @my_total_co2 / 230
    if current_user.goal.present?
      @my_progress = (@my_kiro*100) / goal_to_kiro(current_user.goal)
    end
    counts(current_user)
    car_distance(@my_kiro) # my到達地点の格納
  end
end
