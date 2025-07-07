import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/controller/pay_slip_controller.dart';

class NetPaySummary extends StatelessWidget {
  const NetPaySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();

    return Obx(() => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColorLight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left Text Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Net Payable",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Gross Earnings - Total Deduction",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.hintColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Amount Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.successGreen.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                controller.netPay.value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
