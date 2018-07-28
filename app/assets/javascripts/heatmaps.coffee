$ ->
  class Heatmaps
    constructor: ->
      punchcards = ($('.heatmap-summary').map ->
        $(this).data 'punchcard').toArray()

      if punchcards.length > 0
        punchcards.forEach (punchcard) ->
          cal = new CalHeatMap
          cal.init
            itemSelector: "#cal-heatmap-#{punchcard}"
            displayLegend: false
            #itemNamespace: "cal#{punchcard}"
            data: "/punchcards/#{punchcard}/records.json"
            domain: 'month'
            subDomain: 'x_day'
            itemName: ['hour', 'hours']
            cellSize: 30
            subDomainTextFormat: "%d"
            range: 1
            tooltip: true
            weekStartOnMonday: true
            domainLabelFormat: ''

  jQuery ->
    new Heatmaps
