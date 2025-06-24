import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class FileAttachmentField extends StatelessWidget {
  final VoidCallback onTap;

  const FileAttachmentField({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.attach_file),
            border: InputBorder.none,
          ),
          child: const Text("Choose file"),
        ),
      ),
    );
  }
}
