import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarVctl extends GetxController {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  CalendarFormat formatCalendar = CalendarFormat.month;

  onDaySelected(DateTime daySelected, DateTime dayFocused) {
    if (isSameDay(selectedDay, daySelected)) {
      selectedDay = daySelected;
      focusedDay = dayFocused;
      update();
    }
  }

  onFormatChanged(format) {
    if (formatCalendar != format) {
      formatCalendar = format;
    }
    update();
  }
}
