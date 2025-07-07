import 'package:flutter/material.dart';

class PFUANSection extends StatelessWidget {
  const PFUANSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w500),
            children: [
              TextSpan(text: "PF A/C Number : ", style: TextStyle(color: Colors.black45)),
              TextSpan(
                text: "AA/AAA/999999/99G/9899",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
        const Spacer(),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 10, color: Colors.black45, fontWeight: FontWeight.w500),
            children: [
              TextSpan(text: "UAN :    "),
              TextSpan(
                text: "111111111111",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
