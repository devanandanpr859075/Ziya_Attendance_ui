import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class AttendanceLineChart extends StatelessWidget {
  const AttendanceLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: LineChart(
                LineChartData(
                  minY: 5.5,
                  maxY: 9,
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 0.5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                        dashArray: [5, 4],
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        reservedSize: 30,
                        getTitlesWidget: (value, _) {
                          const months = [
                            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                          ];
                          if (value >= 0 && value < months.length) {
                            return Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  lineTouchData: LineTouchData(enabled: false),
                  lineBarsData: [
                    _buildLine(
                      color: Colors.green,
                      spots: const [
                        FlSpot(0, 7),
                        FlSpot(1, 8),
                        FlSpot(2, 6.5),
                        FlSpot(3, 8),
                        FlSpot(4, 6.5),
                        FlSpot(5, 7.5),
                        FlSpot(6, 7),
                        FlSpot(7, 7.5),
                        FlSpot(8, 7.7),
                        FlSpot(9, 7.9),
                        FlSpot(10, 8),
                        FlSpot(11, 8.5),
                      ],
                    ),
                    _buildLine(
                      color: Colors.red,
                      spots: const [
                        FlSpot(0, 6.5),
                        FlSpot(1, 6.2),
                        FlSpot(2, 6.5),
                        FlSpot(3, 6.9),
                        FlSpot(4, 6.1),
                        FlSpot(5, 6.4),
                        FlSpot(6, 6.8),
                        FlSpot(7, 6.9),
                        FlSpot(8, 6.7),
                        FlSpot(9, 7),
                        FlSpot(10, 6.5),
                        FlSpot(11, 6.3),
                      ],
                    ),
                    _buildLine(
                      color: Colors.blue,
                      spots: const [
                        FlSpot(0, 6.8),
                        FlSpot(1, 7.2),
                        FlSpot(2, 6.7),
                        FlSpot(3, 6.9),
                        FlSpot(4, 6.4),
                        FlSpot(5, 6.8),
                        FlSpot(6, 6.9),
                        FlSpot(7, 7),
                        FlSpot(8, 7.1),
                        FlSpot(9, 7.2),
                        FlSpot(10, 7.1),
                        FlSpot(11, 7.2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildLine({
    required Color color,
    required List<FlSpot> spots,
  }) {
    return LineChartBarData(
      isCurved: false,
      color: color,
      barWidth: 3,
      belowBarData: BarAreaData(show: false),
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 3,
            color: AppColors.cardWhite,
            strokeWidth: 3,
            strokeColor: color,
          );
        },
      ),
      spots: spots,
    );
  }
}
