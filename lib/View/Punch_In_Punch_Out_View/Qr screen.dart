import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ziya_attendance_ui/View/Punch_In_Punch_Out_View/check%20Face%20Verification%20page.dart';
import '../../constants/Text_Constants.dart'; // ✅ Import constants

class QRScreen extends StatelessWidget {
  final String time;
  final bool checkIn;

  const QRScreen({
    super.key,
    required this.time,
    required this.checkIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 125),

            const Text(
              TextConstants.qrVerification,
              style: TextStyle(
                letterSpacing: 2.1,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 1),

            const Text(
              TextConstants.captureQRCode,
              style: TextStyle(
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 140),

            Center(
              child: Container(
                height: 210,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Lottie.asset(
                    'lib/images/Animation - 1750144695893.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 87),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckFaceVerificationScreen(
                          time: time,
                          checkIn: checkIn,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF03A9F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  child: const Text(
                    TextConstants.takePhoto,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
