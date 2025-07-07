import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_attendance_ui/View/Notifications_Page.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/models/CheckIn_Model.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final checkInModel = Provider.of<CheckInModel>(context);

    return Row(
      children: [
        SizedBox(
          width: width * 0.8 + 20,
          child: Stack(
            children: [
              Container(
                width: width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.profileHeader,
                      AppColors.profileHeader_2,
                    ],
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
                          "lib/images/img_5.png",
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
            GestureDetector(
              onTap: checkInModel.isCheckedIn
                  ? () {
                Navigator.push(context, _createSlideRoute());
              }
                  : null,
              child: CircleAvatar(
                backgroundColor: checkInModel.isCheckedIn
                    ? AppColors.primaryColor
                    : AppColors.primaryColor,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            if (checkInModel.isCheckedIn)
              Positioned(
                right: 0,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration:  BoxDecoration(
                    color: AppColors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Route _createSlideRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation,) =>
      const NotificationsPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
