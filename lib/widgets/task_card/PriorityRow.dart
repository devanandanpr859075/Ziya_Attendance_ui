import 'package:flutter/material.dart';

class PriorityLevelRow extends StatelessWidget {
  const PriorityLevelRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text("Priority: ", style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(width: 10),
        Text("Low"),
        SizedBox(width: 12),
        Text("Medium"),
        SizedBox(width: 12),
        Text("High", style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
