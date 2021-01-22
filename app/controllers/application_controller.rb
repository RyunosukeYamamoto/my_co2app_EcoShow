class ApplicationController < ActionController::Base
  
  include SessionsHelper
    
  private
    
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_ecos = user.ecos.count
  end
  
  def car_distance(x)
    if x >= 400
      @prace = '大阪'
    elsif x >= 300
      @prace = '琵琶湖'
    elsif x >= 200
      @prace = '愛知'
    elsif x >= 100
      @prace = '富士山'
    elsif x >= 50
      @prace = '相模原'
    else
      @prace = '府中'
    end
    return @prace
  end
end
