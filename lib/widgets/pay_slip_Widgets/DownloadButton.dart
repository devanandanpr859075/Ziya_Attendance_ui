import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/controller/pay_slip_controller.dart';

class DownloadButton extends StatefulWidget {
  final VoidCallback ontap;
   DownloadButton({super.key, required this.ontap});
  final PayslipController controller = Get.put(PayslipController());


  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: widget.ontap,
          icon: const Icon(Icons.download, color: Colors.white, size: 18),
          label:  Text(
            "Download the sample salary slip format for PDF",
            style: TextStyle(color: AppColors.cardWhite, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF019ee3),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
          ),
        ),
      ),
    );
  }
}
