import "bootstrap";
import { updateBedsChosen } from "./bed_choice"
import { initFullCalendar } from '../plugins/init_calendar'
import { initFlatpickr } from "../plugins/init_flatpickr"

updateBedsChosen()
initFullCalendar();
initFlatpickr();
