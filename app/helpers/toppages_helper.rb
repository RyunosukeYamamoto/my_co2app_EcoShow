module ToppagesHelper
  
  def goal_to_kiro(goal)
    if goal == '大阪'
      @kiro_goal = 400
    elsif goal == '琵琶湖'
      @kiro_goal = 300
    elsif goal == '愛知'
      @kiro_goal = 200
    elsif goal == '富士山'
      @kiro_goal = 100
    elsif goal == '相模原'
      @kiro_goal = 50
    else
      @kiro_goal = goal.to_i
    end
    return @kiro_goal
  end
  
end
