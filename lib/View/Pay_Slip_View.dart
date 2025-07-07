import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/text_constants.dart';
import 'package:ziya_attendance_ui/controller/pay_slip_controller.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/NetPaySummary.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/PFUAN_Section.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/Ziya_Header.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/earnings_table.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/summary_section..dart';
import '../widgets/pay_slip_Widgets/monthly_history.dart';

class PaySlipView extends StatelessWidget {
  PaySlipView({super.key});

  final PayslipController controller = Get.put(PayslipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: ApplyLeaveHeader()),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Get.snackbar(TextConstants.oops, TextConstants.noPreviousPage);
                      }
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    TextConstants.payslipTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RepaintBoundary(
                key: controller.payslipBoundaryKey,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2,
                        child: Center(
                          child: Image.asset(
                            'lib/images/Academy_Logo.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    // Main content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => buildHeader(controller.selectedMonth.value)),
                          const SizedBox(height: 10),
                          const Divider(),
                          const Text(
                            TextConstants.employeeSummary,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          const SummarySection(),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 10),
                          const PFUANSection(),
                          const SizedBox(height: 30),
                          const EarningsTable(),
                          const SizedBox(height: 10),
                          const NetPaySummary(),
                          const SizedBox(height: 8),
                          Obx(() {
                            final netPay = controller.netPay.value;
                            if (netPay.isEmpty) {
                              return const Text(
                                '${TextConstants.amountInWordsLabel} -',
                                style: TextStyle(fontSize: 14),
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${TextConstants.amountInWordsLabel}        ${_amountInWords(netPay)}  ',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 20),
                          const Divider(),
                          const Center(
                            child: Text(
                              TextConstants.generatedNote,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => controller.exportPayslipToPdf(),
                    icon: Icon(Icons.download,
                        color: AppColors.backgroundColor, size: 18),
                    label:  Text(
                      TextConstants.downloadButtonText,
                      style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(TextConstants.monthlyPayslipHistory,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              MonthlyHistory(
                onMonthSelected: controller.loadPayslipDataForMonth,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }



  String _amountInWords(String amount) {
    final value = amount.replaceAll('₹', '').replaceAll(',', '').trim();
    final numericValue = double.tryParse(value) ?? 0;

    if (numericValue == 41000) return "Indian Rupee Forty-One Thousand Only";
    if (numericValue == 43500)
      return "Indian Rupee Forty-Three Thousand Five Hundred Only";
    if (numericValue == 45000) return "Indian Rupee Forty-Five Thousand Only";
    return "Indian Rupee ${numericValue.toInt()} Only";
  }
}
