import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/leave_dashboard_Widgets/LeaveTypeSelector.dart';

class LeaveTypeRow extends StatefulWidget {
  final String text;
  final String text2;

  const LeaveTypeRow({super.key, required this.text, required this.text2});

  @override
  State<LeaveTypeRow> createState() => _LeaveTypeRowState();
}

class _LeaveTypeRowState extends State<LeaveTypeRow> {
  String selectedLeaveType = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            color: AppColors.backgroundColor,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Iconsax.logout),
                    Text(widget.text),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        LeaveTypeSelector(
          selectedLeaveType: selectedLeaveType,
          onLeaveTypeSelected: (String type) {
            setState(() {
              selectedLeaveType = type;
            });
          },
        ),
      ],
    );
  }
}
