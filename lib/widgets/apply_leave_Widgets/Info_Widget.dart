import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class InfoCard extends StatelessWidget {
  final String title, value, subtitle;
  final IconData icon;
  final bool showProgress;
  final double progress;
  final String? rowsub;
  final String? subvalu2;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    this.showProgress = false,
    this.progress = 0.0,
    this.rowsub,
    this.subvalu2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title + Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                Icon(icon, size: 18, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (rowsub != null && rowsub!.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Text(
                    rowsub!,
                    style: const TextStyle(fontSize: 10, letterSpacing: 1),
                  ),
                ],
              ],
            ),

            if (subvalu2 != null && subvalu2!.isNotEmpty)
              Text(
                subvalu2!,
                style: const TextStyle(fontSize: 12),
              ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),

            if (showProgress) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor:  AppColors.primaryColor.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}