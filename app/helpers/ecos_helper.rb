module EcosHelper
  def car_distance(x)
    if x >= 400
      @prace = '大阪'
    elsif x >= 300
      @prace = '琵琶湖'
    elsif x >= 200
      @prace = 愛知
    elsif x>= 100
      @prace = '富士山'
    elsif x>= 50
      @prace = '神奈川'
    else
      @prace = '府中'
    end
    return @prace
  end
end
