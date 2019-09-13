import flatpickr from "flatpickr"

require("flatpickr/dist/flatpickr.css")

const initFlatpickr = () => {
  flatpickr("#booking_start_date", {
    altInput: true,
    minDate: "today"
  });
};

export { initFlatpickr };
