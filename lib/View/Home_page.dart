import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/View/Dashboard_Attendance_View/Dashboard_Attendance_View.dart';
import 'package:ziya_attendance_ui/View/Holiday_List.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/controller/Shared_Preference_Helper.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/click_Out%20Section.dart';
import 'package:ziya_attendance_ui/widgets/Task_view_Sections/TaskSectionWidget.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/ProfileHeader.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/Home_OverviewItem.dart';
import 'package:ziya_attendance_ui/widgets/Home_page_Widgets/Home_dashboard_item.dart';
import 'package:ziya_attendance_ui/widgets/leave_dashboard_Widgets/LeaveDashboardHeaderTabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "User";

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = SharedPreferenceHelper();
    final name = await prefs.getUserName();

    setState(() {
      userName = name ?? "User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: HeaderWidget(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  '${TextConstants.goodMorning}\n$userName',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.topTextcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const CheckInCard(),
                const SizedBox(height: 24),
                const Text(TextConstants.overview,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    OverviewItem(
                        label: TextConstants.presence,
                        count: "20",
                        color: AppColors.profileHeader_2),
                    const SizedBox(width: 12),
                    OverviewItem(
                        label: TextConstants.absence,
                        count: "03",
                        color: AppColors.Textred),
                    const SizedBox(width: 12),
                    OverviewItem(
                        label: TextConstants.leaves,
                        count: "02",
                        color: AppColors.orange),
                  ],
                ),
                const SizedBox(height: 24),
                const TaskSectionWidget(),
                const SizedBox(height: 28),
                const Text(TextConstants.dashboard,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    DashboardItem(
                        icon: Icons.calendar_today,
                        label: TextConstants.attendance,
                        color: AppColors.profileHeader_2,
                        tap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AttendanceCalendarPage();
                          }));
                        }),
                    DashboardItem(
                        icon: Icons.logout,
                        label: TextConstants.leaves,
                        color: AppColors.orange,
                        tap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LeavesScreen()));
                        }),
                    DashboardItem(
                        icon: Icons.fact_check,
                        label: TextConstants.leaveStatus,
                        color: Colors.purple,
                        tap: () {}),
                    DashboardItem(
                        icon: Icons.event_note,
                        label: TextConstants.holidayList,
                        color: Colors.indigo,
                        tap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){return HolidayList();}));
                        }),
                    DashboardItem(
                        icon: Icons.receipt_long,
                        label: TextConstants.payslip,
                        color: Colors.teal,
                        tap: () {}),
                    DashboardItem(
                        icon: Icons.bar_chart,
                        label: TextConstants.reports,
                        color: Colors.redAccent,
                        tap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
