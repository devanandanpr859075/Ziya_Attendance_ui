import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';

class DateRangePicker extends StatelessWidget {
  final VoidCallback onFromTap;
  final VoidCallback onToTap;
  final String fromDate;
  final String toDate;

  const DateRangePicker({
    super.key,
    required this.onFromTap,
    required this.onToTap,
    required this.fromDate,
    required this.toDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "From",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              InkWell(
                onTap: onFromTap,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Iconsax.calendar_1),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Center(child: Text(fromDate)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.compare_arrows),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              Text(
                "To",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: onToTap,
                child: Card(
                  elevation: 5,
                  color: AppColors.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Iconsax.calendar_1),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          // border: Border.all(color: Colors.black.withOpacity(0.5))
                        ),
                        padding: EdgeInsets.all(15),
                        child: Center(child: Text(toDate)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
