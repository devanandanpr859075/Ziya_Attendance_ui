import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/widgets/task_card/SeparatorRow.dart';

class Tasks_pg extends StatelessWidget {
  final String position;
  final String status;
  final String dates;
  final String Time;
  final String titile;
  final String Prioritys;
  final String progress;

  const Tasks_pg({
    super.key,
    required this.position,
    required this.dates,
    required this.titile,
    required this.status,
    required this.Prioritys,
    required this.Time,
    required this.progress,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
      case 'pending task':
        return Colors.orange;
      case 'ongoing':
      case 'ongoing task':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getButtonLabel(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'pending task':
        return 'Start task';
      case 'ongoing':
      case 'ongoing task':
        return 'Make as Done';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title + Progress %
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titile,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                '$progress% Done',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Status row
          Row(
            children: [
              const Text(
                "Status: ",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                status,
                style: TextStyle(
                  color: _getStatusColor(status),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Dates row
          Row(
            children: [
              const Text(
                "Start date: ",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(Time),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                position,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Text(dates),
            ],
          ),
          const SizedBox(height: 8),

          // Priority + Action button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Priority: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    Prioritys,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _getPriorityColor(Prioritys),
                    ),
                  ),
                ],
              ),
              if (_getButtonLabel(status).isNotEmpty)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Handle tap
                  },
                  child: Text(_getButtonLabel(status)),
                ),
            ],
          ),
          const SizedBox(height: 10),
          DashedDividerRow(),
        ],
      ),
    );
  }
}
