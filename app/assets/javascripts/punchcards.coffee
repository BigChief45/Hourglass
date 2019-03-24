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
        'hours': tabler.colors['orange']
      names:
        'hours': 'Hours'
    axis:
      x:
        label:
          text: 'Year'
          position: 'outer-center'
      y:
        label:
          text: 'Hours'
          position: 'outer-middle'
        padding: {top: 120, bottom: 0}
    legend: show: false
    padding:
      bottom: 0
      top: 0)
  return
return
