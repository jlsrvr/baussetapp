import 'fullcalendar';

const initFullCalendar = () => {
  const calendar = document.getElementById("calendar");
  if (calendar)
    {const events = JSON.parse(calendar.dataset.events);

  $('#calendar').fullCalendar({
    locale: "fr",
    height: "parent",
    handleWindowResize: false,
    buttonText: {
      today:    'mtn',
    },
    header: {
      left:   '',
      center: 'prev title next',
      right:  '',
    },
    fixedWeekCount: false,
    events: events,
    eventColor: '$blue',
  })};
};


export { initFullCalendar };
