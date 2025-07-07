import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/Info_Widget.dart';
import '../widgets/Leave_status_Widgets/Leave_Calendar_Widget.dart';
import '../widgets/Leave_status_Widgets/Leave_StatusBar_Chart.dart';
import '../widgets/Leave_status_Widgets/Leave_Table_Widget.dart';
import '../widgets/Leave_status_Widgets/leave_overview_card.dart';

class LeaveStatusView extends StatelessWidget {
  const LeaveStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ApplyLeaveHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.15,
                shrinkWrap: true,
                children: const [
                  InfoCard(
                    title: TextConstants.leaveTaken,
                    value: "16 days",
                    subtitle: TextConstants.remainingThisMonth10,
                    icon: Iconsax.calendar_1,
                    rowsub: "",
                    showProgress: true,
                    progress: 0.76,
                  ),
                  InfoCard(
                    title: TextConstants.leaveBalance,
                    value: "8 days",
                    rowsub: "",
                    subtitle: TextConstants.remainingThisMonth25,
                    icon: Iconsax.calendar_1,
                  ),
                  InfoCard(
                    title: TextConstants.pendingRequest,
                    value: "1 request",
                    rowsub: "",
                    subtitle: TextConstants.remainingThisMonth29,
                    icon: Iconsax.timer,
                  ),
                  InfoCard(
                    title: TextConstants.approvedLeaves,
                    value: "5 leaves",
                    rowsub: "",
                    subtitle: TextConstants.remainingThisMonth29,
                    icon: Iconsax.tick_circle,
                  ),
                  InfoCard(
                    title: TextConstants.rejectedLeaves,
                    value: "2 leaves",
                    rowsub: "",
                    subtitle: TextConstants.remainingThisMonth29,
                    icon: Iconsax.close_circle,
                  ),
                  InfoCard(
                    title: TextConstants.upcomingLeaves,
                    value: "1 leaves",
                    subvalu2: TextConstants.scheduledLeaveDate,
                    rowsub: "",
                    subtitle: TextConstants.remainingThisMonth29,
                    icon: Icons.calendar_month,
                  ),
                ],
              ),
              const SizedBox(height: 10),
               LeaveCalendarWidget(),
               LeaveTableWidget(),
              const SizedBox(height: 20),
              buildLeaveOverviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
