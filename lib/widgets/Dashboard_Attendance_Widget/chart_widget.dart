import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 45,
          sectionsSpace: 3,
          sections: [
            _sectionData(20, "20\n Days", Colors.green),
            _sectionData(3, "03\n Days", Colors.red),
            _sectionData(2.5, "02\n Days", Colors.orange),
            _sectionData(6, "06\n Days", Colors.blue),
          ],
        ),
      ),
    );
  }

  PieChartSectionData _sectionData(double value, String label, Color color) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 60,
      title: label,
      titlePositionPercentageOffset: 0.6,
      titleStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
