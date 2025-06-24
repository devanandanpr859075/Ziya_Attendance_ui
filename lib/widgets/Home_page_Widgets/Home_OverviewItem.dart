import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {
  final String label, count;
  final Color color;

  const OverviewItem({super.key, required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Text(label, style: TextStyle(fontSize: 14, color: color)),
              const SizedBox(height: 20),
              Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
