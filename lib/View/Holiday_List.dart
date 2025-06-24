import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_attendance_ui/View/Leaves_view/Leave_Dashboard.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';

import '../widgets/Holiday_Widgets/Row_Color_Widget.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), child: ApplyLeaveHeader()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.15,
                  children: const [
                    InfoCard(
                      title: "Total \n Holidays",
                      value: "18 days",
                      subtitle: "In a Year",
                      icon: Iconsax.calendar_1,
                      rowsub: "",
                      showProgress: true,
                      progress: 0.36,
                    ),
                    InfoCard(
                      title: "Upcoming\n Holidays",
                      value: "4",
                      rowsub: "(Bakrid - 17 June)",
                      subtitle: "29 days remaining this year",
                      icon: Iconsax.calendar_1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      ColorLabel(color: Colors.green, label: 'Public'),
                      SizedBox(width: 24),
                      ColorLabel(color: Colors.yellow, label: 'Optional'),
                      SizedBox(width: 24),
                      ColorLabel(color: Colors.blue, label: 'Company'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildCalendarBody(),
                SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columnWidths: const {
                      0: FlexColumnWidth(2), // Vertical headers
                      1: FlexColumnWidth(2.5),
                      2: FlexColumnWidth(2.5),
                      3: FlexColumnWidth(2.5),
                    },
                    children: [
                      _buildVerticalRow(
                          "Date", ["17 June", "15 August", "23 October"]),
                      _buildVerticalRow(
                          "Day", ["Tuesday", "Thursday", "Wednesday"]),
                      _buildVerticalRow("Holiday Name",
                          ["Bakrid", "Independence Day", "Diwali"]),
                      _buildVerticalRow("Type",
                          ["Public Holiday", "National Holiday", "Optional"]),
                      _buildVerticalRow("Note", [
                        "Company-wide holiday",
                        "Paid Leave",
                        "Can be applied"
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCalendarBody() {
    final focusedDay = DateTime(2025, 6, 1); // Static for now

    final Map<DateTime, Color> dateColors = {
      DateTime.utc(2025, 6, 3): Colors.green,
      DateTime.utc(2025, 6, 12): Colors.green,
      DateTime.utc(2025, 6, 16): Colors.blue,
      DateTime.utc(2025, 6, 17): Colors.blue,
      DateTime.utc(2025, 6, 20): Colors.yellow,
      DateTime.utc(2025, 6, 25): Colors.blue,
    };

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
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
                Text("Sun",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                Text("Mon", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Tue", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Wed", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Thu", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Fri", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Sat", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            headerVisible: true,
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false),
            daysOfWeekVisible: false,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            rowHeight: 48,
            sixWeekMonthsEnforced: true,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              isTodayHighlighted: false,
              defaultTextStyle: TextStyle(color: Colors.black),
              weekendTextStyle: TextStyle(color: Colors.red),
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
                      color: color ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: day.weekday == DateTime.sunday
                            ? Colors.red
                            : Colors.black,
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

  TableRow _buildVerticalRow(String header, List<String> values) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
        for (final value in values)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
      ],
    );
  }
}
