import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/ProfileHeader.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/date_range_picker_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/dropdown_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/file_attachment_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/form_field_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/submit_button_widget.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({super.key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final reasonController = TextEditingController();

  String fromDate = "From Date";
  String toDate = "To Date";
  String selectedType = "Choose Type";

  List<String> leaveTypes = ["Sick Leave", "Casual Leave", "Emergency Leave"];

  void pickDate(BuildContext context, bool isFrom) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        String formattedDate = "${date.day}-${date.month}-${date.year}";
        if (isFrom) {
          fromDate = formattedDate;
        } else {
          toDate = formattedDate;
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Apply for Leave",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              CustomFormField(
                label: "Employee Name",
                hintText: "Employee Name - auto-filled",
                icon: Icons.person,
                controller: nameController,
                readOnly: true,
              ),
              CustomFormField(
                label: "Employee ID",
                hintText: "Employee ID - auto-filled",
                icon: Icons.badge,
                controller: idController,
                readOnly: true,
              ),
              DateRangePicker(
                fromDate: fromDate,
                toDate: toDate,
                onFromTap: () => pickDate(context, true),
                onToTap: () => pickDate(context, false),
              ),
              const SizedBox(height: 16),
              LeaveTypeRow(text: "Leave Type", text2: 'Choose Type'),
              const SizedBox(height: 28),
              const Text(
                "Reason",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: TextField(
                    controller: reasonController,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      hintText: "Type your reason...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Attachment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              FileAttachmentField(onTap: () {}),
              const SizedBox(height: 32),
              SubmitButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
