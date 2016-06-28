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
    
});