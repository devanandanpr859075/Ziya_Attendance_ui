import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziya_attendance_ui/controller/pay_slip_controller.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class EarningsTable extends StatelessWidget {
  const EarningsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColorLight),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: EarningsHeader(),
          ),
          Obx(() => Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.lightBlueAccent.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Gross Earnings", style: _labelStyle),
                Text(controller.grossEarnings.value, style: _valueStyle),
                const SizedBox(width: 16),
                Text("Total Deductions", style: _labelStyle),
                Text(controller.totalDeductions.value, style: _valueStyle),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class EarningsHeader extends StatelessWidget {
  const EarningsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PayslipController>();

    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: Text("EARNINGS", style: _headerStyle)),
            Expanded(child: Text("AMOUNT", style: _headerStyle)),
            Expanded(child: Text("YTD", style: _headerStyle)),
            Expanded(flex: 2, child: Text("DEDUCTIONS", style: _headerStyle)),
            Expanded(child: Text("AMOUNT", style: _headerStyle)),
          ],
        ),
        const SizedBox(height: 6),
        for (int i = 0; i < controller.earnings.length; i++)
          _buildRow(
            controller.earnings[i]['name'] ?? '',
            controller.earnings[i]['amount'] ?? '',
            controller.earnings[i]['ytd'] ?? '',
            i < controller.deductions.length ? controller.deductions[i]['name'] ?? '' : '',
            i < controller.deductions.length ? controller.deductions[i]['amount'] ?? '' : '',
          ),
      ],
    ));
  }

  static Widget _buildRow(String eName, String eAmt, String eYTD, String dName, String dAmt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(eName, style: _rowTextStyle)),
          Expanded(child: Text(eAmt, style: _rowTextStyle)),
          Expanded(child: Text(eYTD, style: _rowTextStyle)),
          Expanded(flex: 2, child: Text(dName, style: _rowTextStyle)),
          Expanded(child: Text(dAmt, style: _rowTextStyle)),
        ],
      ),
    );
  }
}

// TextStyles
const TextStyle _labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 12.5,
  color: Colors.black,
);

const TextStyle _valueStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

const TextStyle _rowTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

const TextStyle _headerStyle = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
);
