import 'package:flutter/cupertino.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({required this.color, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.rectangle)),
        const SizedBox(width: 7),
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 15),
      ],
    );
  }
}