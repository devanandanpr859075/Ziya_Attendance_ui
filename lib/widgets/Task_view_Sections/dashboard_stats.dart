import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/models/stat_model.dart';
import 'package:ziya_attendance_ui/widgets/Task_view_Sections/stat_card.dart';

class DashboardStats extends StatelessWidget {
  const DashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      StatModel(Icons.calendar_today, 'Today Working\nDays', '20'),
      StatModel(Icons.access_time, 'Total Hours Worked', '160 hours'),
      StatModel(Icons.av_timer, 'Average Daily Hours', '8.0 hours'),
      StatModel(Icons.bar_chart, 'Productivity Indicator', '80%'),
      StatModel(Icons.people_alt_outlined, 'Projects Involved','Revenue Dashboard'),
      StatModel(Icons.assignment_turned_in, 'Leave Token', '2 days'),
    ];

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: stats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return StatCard(stat: stats[index]);
            },
          ),
        ),
      ),
    );
  }
}
