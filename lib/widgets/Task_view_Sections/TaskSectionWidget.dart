import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/3_page.dart';
import 'package:ziya_attendance_ui/models/TaskCardModel.dart';
import 'package:ziya_attendance_ui/widgets/Task_view_Sections/dashboard_stats.dart';
import 'package:ziya_attendance_ui/widgets/task_card/task_card_widget.dart';

class TaskSectionWidget extends StatefulWidget {
  const TaskSectionWidget({super.key});

  @override
  State<TaskSectionWidget> createState() => _TaskSectionWidgetState();
}

class _TaskSectionWidgetState extends State<TaskSectionWidget> {
  int selectedSort = 0;
  int selectedTab = 0;

  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'UI/UX Design Implementation',
      'description': 'Translate designs into responsive into funcation and visualy oppealing using technologies HTML,CSS AND AND JAVASCRIPT',
      'color': Colors.green,
      'icon': Icons.design_services,
    },
    {
      'title': 'Backend Integration',
      'description': 'Integrate REST/GraphQL APIs and manage authentication.',
      'color': Colors.blue,
      'icon': Icons.cloud_sync,
    },
    {
      'title': 'Bug Fixes',
      'description': 'Resolve performance and functional issues found in testing.',
      'color': Colors.red,
      'icon': Icons.bug_report,
    },
  ];

  final List<String> tabLabels = [
    'My Tasks',
    'Task Tracker',
    'Ongoing & Pending Tasks',
    'Work Summary'
  ];

  final List<IconData> tabIcons = [
    Icons.calendar_month,
    Iconsax.timer,
    Iconsax.refresh_circle,
    Icons.folder_copy
  ];

  Widget _buildTab(String label, IconData icon, int index) {
    final isSelected = index == selectedTab;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.black87, size: 18),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedSort,
          onChanged: (val) => setState(() => selectedSort = val!),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const SizedBox(width: 0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: task['color'],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '• ${task['description']}',
                        style: const TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Container(
              width: 110,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text("Start", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0: // My Tasks
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) => _buildTaskCard(tasks[index]),
        );

      case 1: // Task Tracker
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 8),
          children: [
            TaskCardWidget(task: TaskCardModel(title: "Responsive Design", progress: 0.34)),
            TaskCardWidget(task: TaskCardModel(title: "API Integration", progress: 0.68)),
            TaskCardWidget(task: TaskCardModel(title: "Testing & QA", progress: 0.85)),
          ],
        );


      case 2:
        return Column(
          children: [
            Tasks_pg(
              dates: '12-06-2025',
              position: 'Expected completion:',
              titile: 'UI/UX Design Implementation',
              status: 'Ongoing Task',
              Prioritys: 'High',
              Time: '12-05-2025',
              progress: '60',
            ),
            Tasks_pg(
              dates: '12-06-2025',
              position: 'Due date:',
              titile: 'Responsive Design',
              status: 'Pending Task',
              Prioritys: 'Medium',
              Time: '12-05-2025',
              progress: '45',
            ),
            Tasks_pg(
              dates: '12-06-2025',
              position: 'Expected completion:',
              titile: 'Back-end Development',
              status: 'Ongoing Task',
              Prioritys: 'High',
              Time: '12-05-2025',
              progress: '75',
            ),
          ],
        );




      case 3:
        return const Center(
          child: DashboardStats()
        );

      default:
        return const SizedBox();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabLabels.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _buildTab(tabLabels[index], tabIcons[index], index),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Sort options
          Row(
            children: [
              const Text("Sort by:", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              _buildRadioOption(0, "Deadline"),
              _buildRadioOption(1, "Project"),
              const Spacer(),
              SizedBox(
                width: 60,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune),
                  iconSize: 34,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildTabContent(),
        ],
      ),
    );
  }
}
