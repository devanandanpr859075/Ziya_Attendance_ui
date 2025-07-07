import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/widgets/pay_slip_Widgets/Summary_Row.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SummaryRow(title: "Employee Name", value: "Hemant Rangarajan"),
              SummaryRow(title: "Designation", value: "Full-stack Developer"),
              SummaryRow(title: "Employee ID", value: "EMP123456"),
              SummaryRow(title: "Date of Joining", value: "30/03/2025"),
              SummaryRow(title: "Pay Period", value: "June 2025"),
              SummaryRow(title: "Pay Date", value: "15/07/2025"),
            ],
          ),
        ),
        const SizedBox(width: 10),
        NetPayBox()
      ],
    );
  }
}

class NetPayBox extends StatelessWidget {
  const NetPayBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFddf4dd), Colors.white],
          stops: [0.6, 0.2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300), // Light border like in image
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 55,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '₹45,000',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Employee Net Pay',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Divider(thickness: 0.8),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Paid Days', style: TextStyle(fontSize: 12)),
              Text('31', style: TextStyle(fontSize: 12)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('LOP Days', style: TextStyle(fontSize: 12)),
              Text('0', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );

  }
}