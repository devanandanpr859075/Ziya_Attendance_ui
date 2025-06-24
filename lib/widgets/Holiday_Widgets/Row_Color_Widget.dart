import 'package:flutter/material.dart';

class ColorLabel extends StatelessWidget {
  final Color color;
  final String label;

  const ColorLabel({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 1),
        ),
      ],
    );
  }
}
