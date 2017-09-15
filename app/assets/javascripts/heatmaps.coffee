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
            itemNamespace: "cal#{punchcard}"
            data: "/punchcards/#{punchcard}/records.json"
            start: (new Date).setMonth((new Date).getMonth() - 6)
            maxDate: new Date
            domain: 'month'
            subDomain: 'day'
            itemName: ['hour', 'hours']
            cellSize: 12
            range: 6
            previousSelector: '#cal-previous'
            nextSelector: '#cal-next'
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

              # Retrieve the ActiveRecord Record object associated with the date of the cell
              if nb != null
                $.ajax(
                  url: '/search_record'
                  data:
                    record_date: date
                    pcard_id: punchcard
                  dataType: 'json'
                ).done (data) ->
                  # Redirect to the obtained record show view
                  record_id = data
                  window.location.href = "/punchcards/#{punchcard}/records/#{record_id}"

  jQuery ->
    new Heatmaps