import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/View/Punch_In_Punch_Out_View/Punch%20in%20successfull_page.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class CheckFaceVerificationScreen extends StatefulWidget {
  final String time;
  final bool checkIn;

  const CheckFaceVerificationScreen({
    super.key,
    required this.time,
    required this.checkIn,
  });

  @override
  State<CheckFaceVerificationScreen> createState() =>
      _CheckFaceVerificationScreenState();
}

class _CheckFaceVerificationScreenState
    extends State<CheckFaceVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(color: AppColors.backgroundColor),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color(0xFFEAF6FF),
                    Color(0xFFB3E5FC),
                    Color(0xFF03A9F4),
                  ],
                  stops: [0.0, 0.23, 0.5, 1.0],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "Center your face",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 0.5,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "point your face right at the box,\nthen take a photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _iconButton(icon: Icons.camera_alt),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Punchin_Successfull(
                                            time: widget.time,
                                            checkIn: widget.checkIn,
                                          )));
                            },
                            child: _mainActionButton()),
                        _iconButton(icon: Icons.flash_on),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton({required IconData icon}) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.backgroundColor,
      child: Icon(icon, color: Colors.black87),
    );
  }

  Widget _mainActionButton() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      child: const Image(
        image: AssetImage("lib/images/icons8-done-64.png"),
      ),
    );
  }
}
