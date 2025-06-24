import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/chart_widget.dart';
import 'package:ziya_attendance_ui/widgets/Dashboard_Attendance_Widget/status_box_widget.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      elevation: 2,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Total Days: 31", style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusBox(color: Colors.green, count: "20", label: "Present"),
                StatusBox(color: Colors.red, count: "03", label: "Absent"),
                StatusBox(color: Colors.orange, count: "02", label: "Leave"),
                StatusBox(color: Colors.blue, count: "06", label: "Late"),
              ],
            ),
            SizedBox(height: 20),
            DonutChart(),
          ],
        ),
      ),
    );
  }
}
