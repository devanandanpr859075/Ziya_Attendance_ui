import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_attendance_ui/controller/CheckIn_Controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ziya_attendance_ui/models/CheckIn_Model.dart';

class CheckInCard extends StatelessWidget {
  const CheckInCard({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CheckInModel>(context);
    final controller = CheckInController(context, model);

    return Card(
      color: Colors.blue.shade50.withOpacity(0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.isCheckedIn
                  ? "You are Punch-in, ${model.checkInTime}"
                  : "You Haven't Punch-in yet",
              style: TextStyle(
                color: model.isCheckedIn ? Colors.green : Colors.red,
              ),
            ),
            if (model.checkOutTime != null)
              Text(
                "Last Checked out at ${model.checkOutTime}",
                style: const TextStyle(color: Colors.blueGrey),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.timer, color: Colors.orange),
                const SizedBox(width: 5),
                Text(
                  "Check-In: ${model.checkInTime} | Check-Out: ${model.checkOutTime}",
                  style: TextStyle(color: Colors.orange.withOpacity(0.9)),
                ),
              ],
            ),
            const SizedBox(height: 7),
            const Row(
              children: [
                Icon(Icons.location_on_sharp, color: Colors.red),
                SizedBox(width: 5),
                Text('Location/lp (for remote attendance)'),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: model.isCheckedIn ? null : controller.handleCheckIn,
                    child: _buildActionButton(
                      enabled: !model.isCheckedIn,
                      label: "Punch In",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: model.isCheckedIn ? controller.handleCheckOut : null,
                    child: _buildActionButton(
                      enabled: model.isCheckedIn,
                      label: "Punch Out",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required bool enabled, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: enabled ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Iconsax.login, size: 20, color: Colors.white),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
