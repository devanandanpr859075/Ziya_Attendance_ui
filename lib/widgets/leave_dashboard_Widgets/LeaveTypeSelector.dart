import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class LeaveTypeSelector extends StatefulWidget {
  final String selectedLeaveType;
  final Function(String) onLeaveTypeSelected;

  const LeaveTypeSelector({
    super.key,
    required this.selectedLeaveType,
    required this.onLeaveTypeSelected,
  });

  @override
  State<LeaveTypeSelector> createState() => _LeaveTypeSelectorState();
}

class _LeaveTypeSelectorState extends State<LeaveTypeSelector> {
  final List<String> leaveTypes = [
    'Casual Leave',
    'Sick Leave',
    'Work From Home',
    'Earned Leave',
  ];

  void _showLeaveTypeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: leaveTypes.map((type) {
                return ListTile(
                  title: Text(type),
                  onTap: () {
                    widget.onLeaveTypeSelected(type);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _showLeaveTypeDialog,
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedLeaveType.isEmpty
                      ? 'Choose Type'
                      : widget.selectedLeaveType,
                  style: const TextStyle(fontSize: 14),
                ),
                const Icon(CupertinoIcons.arrow_up_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
