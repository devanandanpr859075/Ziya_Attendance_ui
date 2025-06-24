import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color Constants.dart';

class StatusBox extends StatelessWidget {
  final Color color;
  final String count;
  final String label;

  const StatusBox({
    super.key,
    required this.color,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.backgroundColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Text(label, style: TextStyle(fontSize: 14, color: color)),
              const SizedBox(height: 7),
              Text(count,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
