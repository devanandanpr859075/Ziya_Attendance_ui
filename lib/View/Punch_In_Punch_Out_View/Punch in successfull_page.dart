import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color Constants.dart';

import '../../constants/Text_Constants.dart';

class Punchin_Successfull extends StatefulWidget {
  final String time;
  final bool checkIn;

  const Punchin_Successfull({
    super.key,
    required this.time,
    required this.checkIn,
  });

  @override
  State<Punchin_Successfull> createState() => _Punchin_SuccessfullState();
}

class _Punchin_SuccessfullState extends State<Punchin_Successfull>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      if (mounted) Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isCheckedIn = widget.checkIn;

    final Color statusColor =
    isCheckedIn ? AppColors.punchInColor : AppColors.punchOutColor;
    final String statusText = isCheckedIn
        ? TextConstants.punchInSuccess
        : TextConstants.punchOutSuccess;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
             AppColors.backgroundColor,
              AppColors.backgroundColor,
              statusColor.withOpacity(0.8)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Center(
              child: FadeTransition(
                opacity: _animation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: statusColor,
                      child: const Image(
                        image: AssetImage("lib/images/icons8-done-64.png"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "$statusText\nat ${widget.time}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
