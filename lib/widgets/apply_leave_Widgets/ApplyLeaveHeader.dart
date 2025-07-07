import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class ApplyLeaveHeader extends StatelessWidget {
  const ApplyLeaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          children: [
            Image.asset(
              'lib/images/images.png',
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 12),


            Expanded(
              child: GestureDetector(
                onTap: () {
                  showSearchDropdown(context);
                },
                child: Card(
                  color: AppColors.backgroundColor,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, size: 20, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Notification Icon
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
                    decoration:  BoxDecoration(
                      color: AppColors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // Profile Image
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('lib/images/download.jpeg'),
            ),
          ],
        ),
      ),
    );
  }

  void showSearchDropdown(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Search",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => Align(
        alignment: Alignment.topCenter,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      "05 May 2025",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Card(
                      color: Colors.lightGreen.shade400,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Search History",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Sick Leave..."),
                const SizedBox(height: 8),
                const Text("23 May 2025..."),
                const SizedBox(height: 8),
                const Text("Casual Leaves..."),
              ],
            ),
          ),
        ),
      ),
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        );
      },
    );
  }
}
