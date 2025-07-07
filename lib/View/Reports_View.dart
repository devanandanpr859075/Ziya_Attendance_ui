import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
import 'package:ziya_attendance_ui/constants/Text_Constants.dart';
import 'package:ziya_attendance_ui/widgets/Reports_Widgets/ClockIn_Out_Table_Widget.dart';
import 'package:ziya_attendance_ui/widgets/apply_leave_Widgets/ApplyLeaveHeader.dart';
import 'package:ziya_attendance_ui/widgets/Reports_Widgets/Attendance_Legend_Item_Widget.dart';

import '../widgets/Reports_Widgets/AttendanceLineChart.dart';
import '../widgets/Reports_Widgets/Report Info Widgents.dart';

class Reports_View extends StatelessWidget {
  const Reports_View({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: ApplyLeaveHeader(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:  [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios) ,style: ButtonStyle(iconSize: WidgetStateProperty.all(16),),color: Colors.black,),
                    SizedBox(width: 8),
                    Text(
                      "Reports",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1.3,
                  children: const [
                    Report_InfoCard(
                      title: "Total Working Days\n(This Month)",
                      value: "22 days",
                      icon: Icons.calendar_month,
                    ),
                    Report_InfoCard(
                      title: "Total Hours\nWorked",
                      value: "145 hrs",
                      icon: Iconsax.timer,
                    ),
                    Report_InfoCard(
                      title: "Tasks Completed",
                      value: "35",
                      subvalu3: "    this month",
                      icon: Iconsax.tick_circle,

                    ),
                    Report_InfoCard(
                      title: "Average Daily \n Hours",
                      value: "6.6",
                      icon: Iconsax.clock,
                      subvalu3: "   hrs/day",
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                const ClockInOutTable(),

                const SizedBox(height: 30),

                const Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 15),
                 Row(
                  children: [
                    LegendItem(color: AppColors.successGreen, label: 'Present'),
                    SizedBox(width: 10),
                    LegendItem(color: AppColors.redAccent, label: 'Absence'),
                    SizedBox(width: 10),
                    LegendItem(color: AppColors.primaryColor, label: TextConstants.avgHours),
                  ],
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 200, child: AttendanceLineChart()),

                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

