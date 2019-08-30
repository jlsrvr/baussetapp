import 'fullcalendar';

const initFullCalendar = () => {
  const calendar = document.getElementById("calendar");
  if (calendar)
    {const events = JSON.parse(calendar.dataset.events);

  $('#calendar').fullCalendar({
    locale: "fr",
    handleWindowResize: true,
    buttonText: {
      today:    'Aujourd\'hui',
    },
    fixedWeekCount: false,
    eventSources: [{
      events: events,
    }]
  })};
};


export { initFullCalendar };
