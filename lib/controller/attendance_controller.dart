import 'package:flutter/material.dart';
import '../constants/Color Constants.dart'; // adjust path as needed

class AttendanceCalendarController {
  final ValueNotifier<DateTime> focusedDayNotifier = ValueNotifier(DateTime.now());

  final DateTime initialFocusedDay = DateTime(2025, 6, 1);

  final Map<DateTime, Color> dateColors = {
    DateTime.utc(2025, 6, 6): AppColors.lightBlueAccent,
    DateTime.utc(2025, 6, 9): AppColors.lightGreenAccent,
    DateTime.utc(2025, 6, 10): AppColors.lightGreenAccent,
    DateTime.utc(2025, 6, 16): AppColors.lightGreenAccent,
    DateTime.utc(2025, 6, 17): AppColors.lightGreenAccent,
    DateTime.utc(2025, 6, 24): AppColors.redAccent,
    DateTime.utc(2025, 6, 25): AppColors.orangeAccent,
  };

  DateTime goToPreviousMonth(DateTime current) {
    return DateTime(
      current.month == 1 ? current.year - 1 : current.year,
      current.month == 1 ? 12 : current.month - 1,
    );
  }

  DateTime goToNextMonth(DateTime current) {
    return DateTime(
      current.month == 12 ? current.year + 1 : current.year,
      current.month == 12 ? 1 : current.month + 1,
    );
  }
}
