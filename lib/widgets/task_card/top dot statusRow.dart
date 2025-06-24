import 'package:flutter/material.dart';

class TopDotStatusRow extends StatelessWidget {
  final List<String> labels;
  final String activeLabel;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double fontSize;
  final FontWeight fontWeight;

  const TopDotStatusRow({
    super.key,
    required this.labels,
    required this.activeLabel,
    this.activeColor = Colors.green,
    this.inactiveColor = const Color(0xFF9E9E9E),
    this.dotSize = 10.0,
    this.fontSize = 10.0,
    this.fontWeight = FontWeight.w500,
  });

  // @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: labels.map((label) {
        final isActive = label == activeLabel;
        return Row(
          children: [
            Container(
              height: dotSize,
              width: dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(width: 12),
          ],
        );
      }).toList(),
    );
  }
}
