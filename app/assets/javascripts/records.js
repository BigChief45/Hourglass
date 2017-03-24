$(function () {
  $('.datepicker').datetimepicker({
    showTodayButton: true,
    useCurrent: true,
    defaultDate: new Date(),
    icons: {
      time: "fa fa-clock-o",
      date: "fa fa-calendar",
      up: "fa fa-arrow-up",
      down: "fa fa-arrow-down",
      previous: 'fa fa-arrow-left',
      next: 'fa fa-arrow-right',
      today: 'fa fa-calendar-times-o'
    }
  });

  // RICH TEXT TEXT AREA
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({'toolbar': {
      'fa': true,
      'color': true
      }
    });
  });

  // Bootstrap Slider
  $("#record_hours").slider({
    id: 'hoursSlider',
    tooltip: 'hide',
    step: 1,
    min: 1,
    max: 24,

    ticks: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    ticks_labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
    ticks_snap_bounds: 1
  });

});