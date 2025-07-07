import 'package:flutter/material.dart';

class DashedDividerRow extends StatelessWidget {
  const DashedDividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        35,
            (index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Text("_", style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
