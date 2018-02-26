module GoalsHelper
  def progress_bar_color(goal, current_value)
    percentage = current_value / goal.monthly_hours

    case percentage
      when 0..0.50 then 'bg-danger'
      when 0.51..0.99 then 'bg-warning'
      when 1..Float::INFINITY then 'bg-success'
    end
  end

  def progress_bar_width(goal, current_value)
    (current_value / goal.monthly_hours ) * 100
  end
end