import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ziya_attendance_ui/View/Punch_In_Punch_Out_View/Face%20Verification_page.dart';
import 'package:ziya_attendance_ui/View/Punch_In_Punch_Out_View/Qr%20screen.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/models/CheckIn_Model.dart';



class CheckInController {
  final BuildContext context;
  final CheckInModel model;

  CheckInController(this.context, this.model);

  void handleCheckIn() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _buildCheckInDialog(),
    );
  }

  void handleCheckOut() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _buildCheckOutDialog(),
    );
  }

  Widget _buildCheckInDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 10,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select Punch-In Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            const Text(
              'Are you working from home or on-site today?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildPunchInButton(
                    label: 'On Site',
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.grey,
                    onPressed: () {
                      final time = DateFormat('hh:mm a').format(DateTime.now());
                      model.checkIn(time, false);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QRScreen(time: time, checkIn: true),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildPunchInButton(
                    label: 'Work From Home',
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      final time = DateFormat('hh:mm a').format(DateTime.now());
                      model.checkIn(time, true);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FaceVerificationScreen(time: time, checkIn: true),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPunchInButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        side: borderColor != null ? BorderSide(color: borderColor) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Text(label, style: TextStyle(color: textColor, fontSize: 14)),
    );
  }

  Widget _buildCheckOutDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ),
            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 55),
            const SizedBox(height: 20),
            const Text(
              'Do you really want\nto checkout!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      final time = DateFormat('hh:mm a').format(DateTime.now());
                      model.checkOut(time);
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Update Task', style: TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: model.isCheckedIn
                        ? () {
                      final time = DateFormat('hh:mm a').format(DateTime.now());
                      model.checkOut(time);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => model.isWFH
                              ? FaceVerificationScreen(time: time, checkIn: false)
                              : QRScreen(time: time, checkIn: false),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: model.isCheckedIn ? AppColors.primaryColor : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Iconsax.login, size: 20, color: Colors.white),
                        Text("Punch Out", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
