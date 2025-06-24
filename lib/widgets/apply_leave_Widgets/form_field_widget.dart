import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool readOnly;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.readOnly = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Card(
          elevation: 5,
          child: TextField(
            controller: controller,
            // readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14),
              prefixIcon: Icon(icon, size: 20),
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
