$ ->
  class Heatmaps
    constructor: ->
      punchcards = ($('.heatmap').map ->
        $(this).data 'punchcard').toArray()

      if punchcards.length > 0
        punchcards.forEach (punchcard) ->
          cal = new CalHeatMap
          cal.init
            itemSelector: "#cal-heatmap-#{punchcard}"
            #itemNamespace: "cal#{punchcard}"
            data: "/punchcards/#{punchcard}/records.json"
            start: (new Date).setMonth((new Date).getMonth() - 5)
            maxDate: new Date
            domain: 'month'
            subDomain: 'day'
            itemName: ['hour', 'hours']
            cellSize: 12
            range: 6
            previousSelector: "#cal-previous-#{punchcard}"
            nextSelector: "#cal-next-#{punchcard}"
            rowLimit: 7
            highlight: 'now'
            legendVerticalPosition: 'bottom'
            legendHorizontalPosition: 'right'
            tooltip: true
            weekStartOnMonday: false
            domainLabelFormat: '%b'
            label: position: 'top'
            legend: [0.5, 1, 3, 5]
            onClick: (date, nb) ->
              # Parse the date for ActiveRecord
              date = moment(date).format('YYYY-MM-DD HH:mm:ss')

              # Retrieve the ActiveRecord Record object associated with the
              # date of the cell
              if nb != null
                $.ajax(
                  url: "/punchcards/#{punchcard}/records/search"
                  data:
                    record_date: date
                  dataType: 'json'
                ).done (data) ->
                  # Redirect to the obtained record show view
                  record_id = data
                  window.location.href = "/punchcards/#{punchcard}/records/#{record_id}"

  jQuery ->
    new Heatmaps