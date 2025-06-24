import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width * 0.8 + 20,
          child: Stack(
            children: [
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.profileHeader, AppColors.profileHeader_2],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "lib/images/download.jpeg",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.white24,
                            alignment: Alignment.center,
                            child: const Icon(Icons.error, color: Colors.white),
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hemant Rangarajan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Full-stack Developer",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 9,
                right: 5,
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/images.png'),
                  radius: 22,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.notifications, color: Colors.white, size: 28),
            ),
            Positioned(
              right: 0,
              top: 2,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
