import 'package:flutter/material.dart';

class CheckInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final Color color;

  const CheckInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text(time, style: TextStyle(color: color)),
          ],
        )
      ],
    );
  }
}
