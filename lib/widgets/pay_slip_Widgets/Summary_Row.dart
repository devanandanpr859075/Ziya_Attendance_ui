import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String title;
  final String value;

  const SummaryRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          SizedBox(
              width: 80,
              child: Text("$title :",
                  style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.black45))),
          Flexible(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10))),
        ],
      ),
    );
  }
}