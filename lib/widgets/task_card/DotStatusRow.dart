import 'package:flutter/material.dart';

class DotStatusRow extends StatelessWidget {
  final String currentStatus;

  const DotStatusRow({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    Widget _buildStatusDot(String label, bool isActive) {
      return Column(
        children: [

          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.grey.shade600,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatusDot("Start", currentStatus == "Start"),
            _buildStatusDot("Update", currentStatus == "Update"),
            _buildStatusDot("Complete", currentStatus == "Complete"),
          ],
        ),
        const SizedBox(height: 8),

      ],
    );
  }
}
