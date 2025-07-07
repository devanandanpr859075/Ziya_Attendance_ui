import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/widgets/Leave_status_Widgets/leave_overview_card.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/Info_Widget.dart';

class LeaveDashboard extends StatelessWidget {
  const LeaveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.20,
                children: const [
                  InfoCard(
                    title: TextConstants.totalLeaveTaken,
                    value: "16 days",
                    subtitle: "29 days remaining this year",
                    rowsub: '',
                    icon: Icons.calendar_month,
                    showProgress: true,
                    progress: 0.36,
                  ),
                  InfoCard(
                    title: TextConstants.approvalRate,
                    rowsub: '',
                    value: "92%",
                    subtitle: "29 days remaining this year",
                    icon: LineAwesomeIcons.podcast_solid,
                  ),
                  InfoCard(
                    rowsub: '',
                    title: TextConstants.pendingRequest,
                    value: "1",
                    subtitle: "29 days remaining this year",
                    icon: Iconsax.timer,
                  ),
                  InfoCard(
                    rowsub: '',
                    title: TextConstants.teamMemberOnLeave,
                    value: "2",
                    subtitle: "29 days remaining this year",
                    icon: Icons.group,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              buildLeaveOverviewCard(),
              const SizedBox(height: 12),
              Card(
                elevation: 3,
                color: AppColors.backgroundColor,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(TextConstants.upcomingLeave,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 4),
                      const Text(TextConstants.scheduledTimeOff,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(TextConstants.annualLeave,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                              SizedBox(height: 4),
                              Text(TextConstants.leaveDateRange,
                                  style: TextStyle(fontSize: 13, color: Colors.black87)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.leavePendingBorder),
                            ),
                            child: const Text(TextConstants.pending,
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.leavePendingNoteBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.info_outline, size: 20, color: AppColors.leavePendingIcon),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                TextConstants.leavePendingNote,
                                style: TextStyle(fontSize: 13, color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bar(String label, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height,
          width: 70,
          decoration: BoxDecoration(
            color: AppColors.leaveProgressBlue,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
