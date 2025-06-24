import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/widgets/task_card/top%20dot%20statusRow.dart';

class StatusRow extends StatelessWidget {
  final String activeLabel;

  const StatusRow({super.key, required this.activeLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Status: ", style: TextStyle(fontWeight: FontWeight.w500)),
        Expanded(
          child: TopDotStatusRow(
            labels: ["Not Started", "In Progress", "Completed", "Overdue"],
            activeLabel: activeLabel,
          ),
        ),
      ],
    );
  }
}
