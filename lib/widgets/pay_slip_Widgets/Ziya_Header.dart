import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';

Widget buildHeader(String selectedMonth) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('lib/images/Academy_Logo.png'),
        backgroundColor: Colors.transparent,
      ),
      const SizedBox(width: 12),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextConstants.companyName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF019ee3)),
          ),
          Text(
            TextConstants.companyTagline,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF9cbd3a)),
          ),
        ],
      ),
      const Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            TextConstants.payslipMonthPrefix,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          Text(
            selectedMonth,
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      )
    ],
  );
}