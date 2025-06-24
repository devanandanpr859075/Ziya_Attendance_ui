// import 'package:flutter/material.dart';
//
// class CheckInButton extends StatelessWidget {
//   final String label;
//   final bool enabled;
//   final VoidCallback? onTap;
//
//   const CheckInButton({
//     super.key,
//     required this.label,
//     required this.enabled,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: enabled ? onTap : null,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         decoration: BoxDecoration(
//           color: enabled ? Colors.blue : Colors.grey,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.login, size: 20, color: Colors.white),
//             const SizedBox(width: 8),
//             Text(label, style: const TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//     );
//   }
// }
