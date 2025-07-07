import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/Overview_Card_Widget.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/check_info_widget.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/info_box_widget.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/tag_box_widget.dart';
import 'package:ziya_attendance_ui/widgets/task_card/SeparatorRow.dart';
import '../../constants/Color Constants.dart';
import '../../constants/Text_Constants.dart';
import '../../controller/attendance_controller.dart';

class AttendanceCalendarPage extends StatefulWidget {
  const AttendanceCalendarPage({super.key});

  @override
  State<AttendanceCalendarPage> createState() => _AttendanceCalendarPageState();
}

class _AttendanceCalendarPageState extends State<AttendanceCalendarPage> {
  final AttendanceCalendarController _controller = AttendanceCalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          TextConstants.attendanceCalendar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.textBlack,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarCard(),
            const SizedBox(height: 20),
            _buildOverviewCard(),
            const SizedBox(height: 30),
            const Text(
              TextConstants.dateLabel,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AppColors.textBlack,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TextConstants.status, style: TextStyle(fontSize: 15)),
                Chip(
                  label:  Text(
                    TextConstants.present,
                    style: TextStyle(color: AppColors.punchInColor),
                  ),
                  color: WidgetStatePropertyAll(
                    Colors.greenAccent.withOpacity(0.3),
                  ),
                  side: BorderSide.none,
                ),
              ],
            ),
            DashedDividerRow(),
            const SizedBox(height: 10),
            Row(
              children:  [
                CheckInfoRow(
                  icon: Icons.alarm_on,
                  label: TextConstants.checkIn,
                  time: TextConstants.checkInTime,
                  color: AppColors.punchInColor,
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width: 50, child: Divider(thickness: 1.2)),
                    Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.hintColor),
                  ],
                ),
                Spacer(),
                CheckInfoRow(
                  icon: Icons.alarm_off,
                  label: TextConstants.checkOut,
                  time: TextConstants.checkOutTime,
                  color: AppColors.punchInColor,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                TagBox(
                  label: TextConstants.workMode,
                  value: TextConstants.office,
                  bgColor: AppColors.tagOfficeBg,
                  textColor: AppColors.tagOfficeText,
                ),
                Spacer(),
                TagBox(
                  label: TextConstants.verification,
                  value: TextConstants.selfie,
                  bgColor: AppColors.tagSelfieBg,
                  textColor: AppColors.tagSelfieText,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const InfoBox(
              icon: Icons.person_pin_circle_outlined,
              label: TextConstants.location,
              value: TextConstants.locationValue,
              iconColor: AppColors.errorRed,
            ),
            const SizedBox(height: 8),
            const InfoBox(
              icon: Icons.text_snippet_outlined,
              label: TextConstants.notes,
              value: TextConstants.workedNote,
              iconColor: AppColors.textBlack,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ValueListenableBuilder<DateTime>(
        valueListenable: _controller.focusedDayNotifier,
        builder: (context, focusedDay, _) {
          return Column(
            children: [
              _buildCalendarHeader(focusedDay),
              const SizedBox(height: 8),
              buildCalendarBody(focusedDay),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCalendarHeader(DateTime focusedDay) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.calendarBorder, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              _controller.focusedDayNotifier.value = _controller.goToPreviousMonth(focusedDay);
            },
          ),
          Text(
            "${focusedDay.year} - ${focusedDay.month.toString().padLeft(2, '0')}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              _controller.focusedDayNotifier.value = _controller.goToNextMonth(focusedDay);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCalendarBody(DateTime focusedDay) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.calendarBorder, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        headerVisible: false,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: AppColors.calendarWeekday,
            fontWeight: FontWeight.bold,
          ),
          weekendStyle: TextStyle(
            color: AppColors.calendarWeekend,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          isTodayHighlighted: false,
          cellMargin: EdgeInsets.all(4),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, _) {
            final dateKey = DateTime.utc(day.year, day.month, day.day);
            final color = _controller.dateColors[dateKey];

            if (dateKey == DateTime.utc(2025, 6, 18)) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: Container(
                      height: 7,
                      width: 7,
                      decoration: const BoxDecoration(
                        color: AppColors.highlightDot,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              );
            }

            if (color != null) {
              return Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                    color: AppColors.textBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            return null;
          },
        ),
      ),
    );
  }

  Widget _buildOverviewCard() {
    return const OverviewCard();
  }
}
