import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class PayslipController extends GetxController {
  final GlobalKey payslipBoundaryKey = GlobalKey();

  final selectedMonth = "June 2025".obs;
  final netPay = "₹45,000".obs;

  final earnings = <Map<String, String>>[].obs;
  final deductions = <Map<String, String>>[].obs;
  final grossEarnings = "₹ 55,000".obs;
  final totalDeductions = "₹ 10,000".obs;

  final downloadedMonths = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadPayslipDataForMonth("June 2025");
  }

  void markAsDownloaded(String month) {
    downloadedMonths[month] = true;
  }

  void loadPayslipDataForMonth(String month) {
    selectedMonth.value = month;

    switch (month) {
      case "March 2025":
        earnings.value = [
          {"name": "Basic", "amount": "₹ 20,000", "ytd": "₹ 60,000"},
          {"name": "HRA", "amount": "₹ 8,000", "ytd": "₹ 24,000"},
        ];
        deductions.value = [
          {"name": "PF Deduction", "amount": "₹ 2,000"},
          {"name": "Tax Deduction", "amount": "₹ 3,000"},
        ];
        grossEarnings.value = "₹ 28,000";
        totalDeductions.value = "₹ 5,000";
        netPay.value = "₹23,000";
        break;

      case "April 2025":
        earnings.value = [
          {"name": "Basic", "amount": "₹ 22,000", "ytd": "₹ 66,000"},
          {"name": "HRA", "amount": "₹ 9,000", "ytd": "₹ 27,000"},
          {"name": "Travel Allowance", "amount": "₹ 3,000", "ytd": "₹ 36,000"},
        ];
        deductions.value = [
          {"name": "PF Deduction", "amount": "₹ 2,500"},
          {"name": "Tax Deduction", "amount": "₹ 4,000"},
        ];
        grossEarnings.value = "₹ 34,000";
        totalDeductions.value = "₹ 6,500";
        netPay.value = "₹27,500";
        break;

      case "May 2025":
        earnings.value = [
          {"name": "Basic", "amount": "₹ 25,000", "ytd": "₹ 75,000"},
          {"name": "HRA", "amount": "₹ 10,000", "ytd": "₹ 30,000"},
          {"name": "Travel Allowance", "amount": "₹ 3,000", "ytd": "₹ 39,000"},
          {"name": "Meal Allowance", "amount": "₹ 2,000", "ytd": "₹ 26,000"},
        ];
        deductions.value = [
          {"name": "PF Deduction", "amount": "₹ 2,500"},
          {"name": "Tax Deduction", "amount": "₹ 7,500"},
        ];
        grossEarnings.value = "₹ 40,000";
        totalDeductions.value = "₹ 10,000";
        netPay.value = "₹30,000";
        break;

      case "June 2025":
        earnings.value = [
          {"name": "Basic", "amount": "₹ 30,000", "ytd": "₹ 1,05,000"},
          {"name": "HRA", "amount": "₹ 12,000", "ytd": "₹ 42,000"},
          {"name": "Travel Allowance", "amount": "₹ 3,000", "ytd": "₹ 42,000"},
          {"name": "Meal Allowance", "amount": "₹ 2,000", "ytd": "₹ 28,000"},
        ];
        deductions.value = [
          {"name": "PF Deduction", "amount": "₹ 3,000"},
          {"name": "Tax Deduction", "amount": "₹ 7,000"},
        ];
        grossEarnings.value = "₹ 47,000";
        totalDeductions.value = "₹ 10,000";
        netPay.value = "₹37,000";
        break;
    }
  }

  Future<void> exportPayslipToPdf() async {
    try {
      RenderRepaintBoundary boundary = payslipBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final pdf = pw.Document();
      final imageWidget = pw.MemoryImage(pngBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(imageWidget));
          },
        ),
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: "Payslip_${selectedMonth.value}.pdf",
      );
    } catch (e) {
      print(" Error exporting PDF: $e");
    }
  }
}
