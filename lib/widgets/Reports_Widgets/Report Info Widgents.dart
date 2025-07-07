
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class Report_InfoCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  final bool showProgress;

  final String? rowsub;
  final String? subvalu2;
  final String? subvalu3;

  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subvalu2Style;
  final TextStyle? subvalu3Style;
  final TextStyle? rowsubStyle;
  final Color? iconColor;
  final Color? cardColor;

  const Report_InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.showProgress = false,
    this.rowsub,
    this.subvalu2,
    this.subvalu3,
    this.titleStyle,
    this.valueStyle,
    this.subvalu2Style,
    this.subvalu3Style,
    this.rowsubStyle,
    this.iconColor,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? AppColors.backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(icon, size: 18, color: iconColor ?? Colors.blue),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: valueStyle ?? const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                if (subvalu3 != null && subvalu3!.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Text(
                    subvalu3!,
                    style: subvalu3Style ?? const TextStyle(fontSize: 12),
                  ),
                ],
              ],
            ),
            if (rowsub != null && rowsub!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  rowsub!,
                  style: rowsubStyle ?? const TextStyle(fontSize: 10, letterSpacing: 1),
                ),
              ),
            if (subvalu2 != null && subvalu2!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subvalu2!,
                  style: subvalu2Style ?? const TextStyle(fontSize: 12),
                ),
              ),

            const SizedBox(height: 10),


            if (showProgress) ...[
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}