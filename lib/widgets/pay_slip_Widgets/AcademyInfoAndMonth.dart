import 'package:flutter/material.dart';

class AcademyInfoAndMonth extends StatelessWidget {
  const AcademyInfoAndMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('lib/images/Academy_Logo.png'),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "ZiyaAcademy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF019ee3)),
            ),
            Text(
              "KEY-TO SUCCESS",
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
          children: const [
            Text(
              "Payslip for the Month",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            Text(
              "June 2025",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
