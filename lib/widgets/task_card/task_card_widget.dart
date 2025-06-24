import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/widgets/task_card/DotStatusRow.dart';
import 'package:ziya_attendance_ui/models/TaskCardModel.dart';
import 'package:ziya_attendance_ui/widgets/task_card/PriorityRow.dart';
import 'package:ziya_attendance_ui/widgets/task_card/ProgressSection.dart';
import 'package:ziya_attendance_ui/widgets/task_card/SeparatorRow.dart';
import 'package:ziya_attendance_ui/widgets/task_card/StatusIndicatorRow.dart';


class TaskCardWidget extends StatelessWidget {
  final TaskCardModel task;

  const TaskCardWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          const StatusIndicatorRow(activeLabel: 'Completed'),
          const SizedBox(height: 16),
          ProgressInfoRow(progress: task.progress),
          const SizedBox(height: 16),
          const PriorityLevelRow(),
          const SizedBox(height: 16),
          const DotStatusRow(currentStatus: "Update"),
          const DashedDividerRow(),
        ],
      ),
    );
  }
}
