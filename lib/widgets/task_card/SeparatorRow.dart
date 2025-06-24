import 'package:flutter/material.dart';

class DashedDividerRow extends StatelessWidget {
  const DashedDividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        50,
            (index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Text("-", style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
