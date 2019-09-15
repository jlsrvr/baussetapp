import flatpickr from "flatpickr"

import "flatpickr/dist/flatpickr.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  flatpickr("#booking_start_date", {
    altInput: true,
    minDate: "today"
  });
  flatpickr("#booking_end_date", {
    altInput: true,
    minDate: "today"
  });
};

export { initFlatpickr };
