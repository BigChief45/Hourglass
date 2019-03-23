$ ->
  $('[data-toggle="tooltip"]').tooltip()

  # Charts
  chartData = JSON.parse($('#yearly-progress').attr('data-source'))
  chart = c3.generate(
    bindto: '#yearly-progress'
    data:
      json: chartData
      keys:
        x: 'year'
        value: ['hours']
      labels: true
      type: 'area'
      colors:
        'hours': tabler.colors['blue']
      names:
        'hours': 'Hours'
    legend: show: false
    padding:
      bottom: 0
      top: 0)
  return
return
