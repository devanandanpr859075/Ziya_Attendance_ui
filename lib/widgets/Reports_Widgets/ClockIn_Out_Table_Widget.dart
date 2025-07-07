import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class ClockInOutTable extends StatelessWidget {
  const ClockInOutTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Daily Clock-In/Out Log",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 10),
        Card(
          color: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 36,
                dataRowMinHeight: 36,
                dataRowMaxHeight: 40,
                columnSpacing: 30,
                horizontalMargin: 16,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Check-in',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Check-out',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Total\nHrs',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
                rows: [
                  _buildDataRow("June 21", "09:15 AM", "05:45 PM", "8.5 hrs", "Present", Colors.green),
                  _buildDataRow("June 22", "--", "--", "0 hrs", "Absent", Colors.red),
                  _buildDataRow("June 23", "09:30 AM", "04:00 PM", "6.5 hrs", "Half Day", Colors.orange),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(
      String date,
      String checkIn,
      String checkOut,
      String totalHrs,
      String status,
      Color color,
      ) {
    return DataRow(
      cells: [
        DataCell(Text(date)),
        DataCell(Text(checkIn)),
        DataCell(Text(checkOut)),
        DataCell(Text(totalHrs)),
        DataCell(
          Text(
            status,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
