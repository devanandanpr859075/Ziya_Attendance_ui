import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'icon': Icons.close_rounded,
        'title': TextConstants.missedPunch,
        'message': TextConstants.missedPunchMessage,
        'color': AppColors.errorRed,
      },
      {
        'icon': Icons.alarm,
        'title': TextConstants.lateAttendance,
        'message': TextConstants.lateAttendanceMessage,
        'color': AppColors.orange,
      },
      {
        'icon': Icons.wallet,
        'title': TextConstants.dailySummary,
        'message': TextConstants.dailySummaryMessage,
        'color': AppColors.primaryColor,
      },
      {
        'icon': Icons.check_circle_rounded,
        'title': TextConstants.leaveApproval,
        'message': TextConstants.leaveApprovalMessage,
        'color': AppColors.successGreen,
      },
      {
        'icon': Icons.remove_circle_outline,
        'title': TextConstants.leaveRejection,
        'message': TextConstants.leaveRejectionMessage,
        'color': AppColors.errorRed,
      },
      {
        'icon': Icons.repeat_on,
        'title': TextConstants.shiftUpdate,
        'message': TextConstants.shiftUpdateMessage,
        'color': AppColors.lightBlueAccent,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Close button
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: AppColors.textColor, size: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    TextConstants.notificationsTitle,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlack,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: item['color'] as Color,
                            size: 24,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: item['color'] as Color,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['message'] as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
