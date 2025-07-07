import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

Widget LeaveCalendarWidget() {
  final focusedDay = DateTime(2025, 6, 1);

  final Map<DateTime, Color> dateColors = {
    DateTime.utc(2025, 6, 3): AppColors.successGreen.withOpacity(0.8),
    DateTime.utc(2025, 6, 12): AppColors.successGreen.withOpacity(0.8),
    DateTime.utc(2025, 6, 16): AppColors.redAccent,
    DateTime.utc(2025, 6, 17): AppColors.redAccent,
    DateTime.utc(2025, 6, 20): AppColors.warningYellow,
    DateTime.utc(2025, 6, 25): AppColors.calendarWeekday,
  };

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    decoration: BoxDecoration(
      color: AppColors.cardWhite,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.calendarBorder),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weekday Labels
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sun",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.Textred,
                  )),
              const Text("Mon",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
              const Text("Tue",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
              const Text("Wed",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
              const Text("Thu",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
              const Text("Fri",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
              const Text("Sat",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textBlack)),
            ],
          ),
        ),
        TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          headerVisible: true,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: AppColors.textBlack,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          daysOfWeekVisible: false,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          rowHeight: 48,
          sixWeekMonthsEnforced: true,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            isTodayHighlighted: false,
            defaultTextStyle: const TextStyle(color: AppColors.textBlack),
            weekendTextStyle: TextStyle(color: AppColors.Textred),
            cellMargin: const EdgeInsets.all(4),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, _) {
              final dateKey = DateTime.utc(day.year, day.month, day.day);
              final color = dateColors[dateKey];

              return Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColorLight.withOpacity(0.2),
                    ),
                    color: color ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: day.weekday == DateTime.sunday
                          ? AppColors.Textred
                          : AppColors.textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
