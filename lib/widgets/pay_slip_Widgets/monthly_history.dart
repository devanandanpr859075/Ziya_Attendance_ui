import 'package:flutter/material.dart';

class MonthlyHistory extends StatelessWidget {
  final Function(String) onMonthSelected;

  const MonthlyHistory({super.key, required this.onMonthSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: Text("Month", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Net Pay", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          const Divider(),
          _buildHistoryRow("June 2025", "₹45,000", onMonthSelected),
          _buildHistoryRow("May 2025", "₹41,000", onMonthSelected),
          _buildHistoryRow("April 2025", "₹43,500", onMonthSelected),
          _buildHistoryRow("March 2025", "₹41,000", onMonthSelected),
        ],
      ),
    );
  }

  static Widget _buildHistoryRow(
      String month, String amount, Function(String) onTap) {
    return InkWell(
      onTap: () => onTap(month), // Trigger the passed function on tap
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: Text(month)),
            Expanded(flex: 2, child: Text(amount)),
            const Expanded(
              flex: 2,
              child: Row(
                children: [
                  Icon(Icons.verified, color: Colors.green, size: 16),
                  SizedBox(width: 4),
                  Text("Generated", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Row(
                children: [
                  Icon(Icons.download, color: Colors.blue, size: 16),
                  SizedBox(width: 4),
                  Text("Download", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
