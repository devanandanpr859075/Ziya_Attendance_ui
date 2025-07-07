import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

Widget LeaveTableWidget() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
    decoration: BoxDecoration(
      color: AppColors.cardWhite,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderColorLight),
    ),
    child: Table(
      border: TableBorder.symmetric(
        inside: BorderSide(color: AppColors.lightGrey.withOpacity(0.3)),
        outside: BorderSide(color: AppColors.borderColorLight),
      ),
      columnWidths: const {
        0: FlexColumnWidth(2.2),
        1: FlexColumnWidth(2.5),
        2: FlexColumnWidth(2.2),
        3: FlexColumnWidth(3),
      },
      children: [
        buildTableRow("Date", "Leave Type", "Status", "Reason", header: true),
        buildTableRow("10 June", "Sick Leave", "Approved", "Fever"),
        buildTableRow("20 June", "Casual Leave", "Pending", "Family Function"),
        buildTableRow("01 July", "WFH", "Rejected", "No backup"),
      ],
    ),
  );
}

TableRow buildTableRow(
    String date,
    String type,
    String status,
    String reason, {
      bool header = false,
    }) {
  Color? statusColor;
  if (!header) {
    if (status == "Approved") statusColor = AppColors.successGreen;
    else if (status == "Pending") statusColor = AppColors.leavePendingIcon;
    else if (status == "Rejected") statusColor = AppColors.errorRed;
  }

  return TableRow(
    children: [
      tableCell(date, header),
      tableCell(type, header),
      tableCell(status, header, color: statusColor),
      tableCell(reason, header),
    ],
  );
}

Widget tableCell(String text, bool isHeader, {Color? color}) {
  return Container(
    height: 60,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.5,
        color: color ??
            (isHeader ? AppColors.calendarWeekday : AppColors.textBlack),
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}
