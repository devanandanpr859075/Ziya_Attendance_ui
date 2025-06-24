import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressInfoRow extends StatelessWidget {
  final double progress;

  const ProgressInfoRow({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text("Progress: ",
                style: TextStyle(fontWeight: FontWeight.w500)),
            CircularPercentIndicator(
              radius: 24,
              lineWidth: 5,
              percent: progress.clamp(0.0, 1.0),
              center: Text("${(progress * 100).round()}%"),
              progressColor: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),
          ],
        ),

        Row(
          children: const [
            Icon(Icons.timer, color: Colors.orange),
            SizedBox(width: 4),
            Text("2 days\nremaining", style: TextStyle(color: Colors.orange, fontSize: 12)),
          ],
        ),

        Row(
          children: const [
            Icon(Icons.assignment_turned_in),
            SizedBox(width: 4),
            Text("Assigned by\nManager", style: TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
