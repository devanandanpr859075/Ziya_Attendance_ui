import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

Widget buildCalendarBody() {
  final focusedDay = DateTime(2025, 6, 1);

  final Map<DateTime, Color> dateColors = {
    DateTime.utc(2025, 6, 3): AppColors.successGreen,  // Green
    DateTime.utc(2025, 6, 12): AppColors.successGreen,
    DateTime.utc(2025, 6, 16): AppColors.primaryColor, // Blue
    DateTime.utc(2025, 6, 17): AppColors.primaryColor,
    DateTime.utc(2025, 6, 20): AppColors.warningYellow, // Yellow
    DateTime.utc(2025, 6, 25): AppColors.primaryColor,
  };

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    decoration: BoxDecoration(
      color: AppColors.cardWhite,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderColorLight),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weekday Labels
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Sun", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.errorRed)),
              Text("Mon", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              Text("Tue", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              Text("Wed", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              Text("Thu", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              Text("Fri", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
              Text("Sat", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
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
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textBlack,
            ),
          ),
          daysOfWeekVisible: false,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          rowHeight: 48,
          sixWeekMonthsEnforced: true,
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
            isTodayHighlighted: false,
            defaultTextStyle: TextStyle(color: AppColors.textBlack),
            weekendTextStyle: TextStyle(color: AppColors.errorRed),
            cellMargin: EdgeInsets.all(4),
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
                    border: Border.all(color: AppColors.borderColorLight),
                    color: color ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: day.weekday == DateTime.sunday
                          ? AppColors.errorRed
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
