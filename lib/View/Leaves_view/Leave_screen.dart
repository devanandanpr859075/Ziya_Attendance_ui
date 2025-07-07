import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/date_range_picker_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/dropdown_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/form_field_widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/submit_button_widget.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({super.key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final reasonController = TextEditingController();

  String fromDate = TextConstants.fromDate;
  String toDate = TextConstants.toDate;
  DateTime? selectedFromDate;

  String selectedType = TextConstants.chooseType;
  String? _attachedFileName;
  PlatformFile? _pickedFile;
  File? _cameraImageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );
    if (date != null) {
      setState(() {
        selectedFromDate = date;
        fromDate = "${date.day}-${date.month}-${date.year}";
        toDate = TextConstants.toDate;
      });
    }
  }

  Future<void> pickToDate(BuildContext context) async {
    if (selectedFromDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(TextConstants.selectFromDateFirst)),
      );
      return;
    }

    final date = await showDatePicker(
      context: context,
      initialDate: selectedFromDate!.add(const Duration(days: 1)),
      firstDate: selectedFromDate!.add(const Duration(days: 1)),
      lastDate: DateTime(2027),
    );
    if (date != null) {
      setState(() {
        toDate = "${date.day}-${date.month}-${date.year}";
      });
    }
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: AppColors.primaryColor),
              title: const Text("Take Photo (Camera)"),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    _cameraImageFile = File(pickedFile.path);
                    _attachedFileName = _cameraImageFile!.path.split('/').last;
                    _pickedFile = null;
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf, color: AppColors.primaryColor),
              title: const Text("Pick PDF"),
              onTap: () async {
                Navigator.pop(context);
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (result != null && result.files.single.path != null) {
                  setState(() {
                    _pickedFile = result.files.single;
                    _attachedFileName = _pickedFile!.name;
                    _cameraImageFile = null;
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_drive_file, color: AppColors.primaryColor),
              title: const Text("Pick Any File"),
              onTap: () async {
                Navigator.pop(context);
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null && result.files.single.path != null) {
                  setState(() {
                    _pickedFile = result.files.single;
                    _attachedFileName = _pickedFile!.name;
                    _cameraImageFile = null;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildAttachmentField(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () => _showAttachmentOptions(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Icon(Icons.attach_file, color: AppColors.primaryColor),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    if (_cameraImageFile != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image.file(
                          _cameraImageFile!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        _attachedFileName ?? TextConstants.fileoptions,
                        style: TextStyle(color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(TextConstants.formSuccess)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  TextConstants.applyLeaveTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 24),
                CustomFormField(
                  label: TextConstants.employeeName,
                  hintText: TextConstants.employeeNameHint,
                  icon: Icons.person,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  label: TextConstants.employeeID,
                  hintText: TextConstants.employeeIDHint,
                  icon: Icons.badge,
                  controller: idController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your Employee ID";
                    }
                    return null;
                  },
                ),
                DateRangePicker(
                  fromDate: fromDate,
                  toDate: toDate,
                  onFromTap: () => pickFromDate(context),
                  onToTap: () => pickToDate(context),
                ),
                const SizedBox(height: 16),
                LeaveTypeRow(text: TextConstants.leaveType, text2: selectedType),
                const SizedBox(height: 28),
                const Text(
                  TextConstants.reasonLabel,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  color: AppColors.cardColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: TextField(
                      controller: reasonController,
                      maxLines: 4,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: TextConstants.reasonHint,
                        hintStyle: TextStyle(color: AppColors.hintColor),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  TextConstants.attachment,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                _buildAttachmentField(context),
                const SizedBox(height: 32),
                SubmitButton(onPressed: _submitForm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
