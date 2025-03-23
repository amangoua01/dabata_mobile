import 'package:dabata_mobile/models/paiement.dart';
import 'package:dabata_mobile/views/controllers/table_calendar_vctl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:table_calendar/table_calendar.dart';

class TabCalendar extends StatelessWidget {
  final List<Paiement> paiements;
  final void Function(DateTime) onDaySelected;
  const TabCalendar({
    this.paiements = const [],
    required this.onDaySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableCalendarVctl>(
      init: TableCalendarVctl(),
      builder: (ctl) {
        return TableCalendar(
          locale: "fr",
          focusedDay: ctl.selectedDate,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          calendarFormat: ctl.formatCalendar,
          onDaySelected: (selectedDay, focusedDay) =>
              ctl.onDaySelected(selectedDay, focusedDay),
          onFormatChanged: ctl.onFormatChanged,
          selectedDayPredicate: (day) => isSameDay(ctl.selectedDate, day),
          headerVisible: true,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: true,
          ),
          eventLoader: (day) {
            return paiements.where((e) => e.isSameDatePaiement(day)).toList();
          },
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
            weekendStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
