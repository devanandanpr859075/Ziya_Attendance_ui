import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/View/Leaves_view/Leave_Dashboard.dart';
import 'package:ziya_attendance_ui/View/Leaves_view/Leave_screen.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    LeaveDashboard(),
    ApplyLeavePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: ApplyLeaveHeader(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTabItem(
                      index: 0, icon: Icons.dashboard, label: 'Dashboard'),
                  const SizedBox(width: 16),
                  _buildTabItem(
                      index: 1,
                      icon: Icons.edit_calendar_outlined,
                      label: 'Request Leave'),
                ],
              ),
            ),
            Expanded(child: screens[selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
      {required int index, required IconData icon, required String label}) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Row(
        children: [
          Icon(icon,
              size: 18, color: isSelected ? Colors.blue : Colors.black54),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primaryColor : AppColors.topTextcolor,
            ),
          ),
        ],
      ),
    );
  }
}
