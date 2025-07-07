
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/Leave_status_Widgets/Leave_StatusBar_Chart.dart';


Widget buildLeaveOverviewCard() {
  return Card(
    color: AppColors.backgroundColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Leave Overview", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 1)),
          const SizedBox(height: 4),
          const Text("Your leave distribution for the current year", style: TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 70),
          LeaveStatusBarChart(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.circle, size: 8, color: Colors.blue),
              SizedBox(width: 6),
              Text("Leave days taken", style: TextStyle(fontSize: 12, color: Colors.grey,fontWeight: FontWeight.w700)),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total days", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text("23", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Remaining", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text("23", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}