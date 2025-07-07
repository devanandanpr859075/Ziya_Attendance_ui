import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

Widget LeaveStatusBarChart() {
  return SizedBox(
    height: 80,
    child: BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final labels = ['Q1', 'Q2', 'Q3', 'Q4'];
                if (value.toInt() < 0 || value.toInt() >= labels.length) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    labels[value.toInt()],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 50,
                width: 70,
                color: AppColors.leaveProgressBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 30,
                width: 70,
                color: AppColors.leaveProgressBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 20,
                width: 70,
                color: AppColors.leaveProgressBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 10,
                width: 70,
                color: AppColors.leaveProgressBlue,
                borderRadius: BorderRadius.circular(1),
              ),
            ],
          ),
        ],
        maxY: 60,
      ),
    ),
  );
}
