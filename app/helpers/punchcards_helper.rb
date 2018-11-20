module PunchcardsHelper
  def format_hours(hours)
    "%g" % hours
  end

  def show_hours_diff(current, previous)
    diff = current - previous
    color_class = diff >= 0 ? 'text-green' : 'text-red'
    icon = diff >= 0 ? 'fe fe-chevron-up' : 'fe fe-chevron-down'

    tag.div(class: "text-right #{color_class}") do
      tag.span("#{diff < 0 ? '-' : ''}#{diff}", class: 'mr-1') +
      tag.i(class: icon)
    end
  end
end
