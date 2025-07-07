import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ziya_attendance_ui/controller/profile_controller.dart';
import 'package:ziya_attendance_ui/widgets/profile_view_Widgets/dotted_divider.dart';
import 'package:ziya_attendance_ui/widgets/profile_view_Widgets/info_row_Widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ProfileController().getProfileData();
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/images/img_3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            CupertinoColors.activeBlue.withOpacity(0.2),
                            Colors.lightGreen.withOpacity(0.1),
                            Colors.lightGreen.withOpacity(0.3),
                          ])
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: MediaQuery.of(context).size.width / 2 - 30,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hemant Rangarajan",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1597cd),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Full-stack Developer",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),


                  Positioned(
                    bottom: -60,
                    left: MediaQuery.of(context).size.width / 3 - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 57,
                            backgroundImage: AssetImage("lib/images/img_5.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InfoRow(title: "Name", value: profile.name),
                      const DottedDivider(),
                      InfoRow(title: "Employee ID", value: profile.employeeId),
                      const DottedDivider(),
                      InfoRow(title: "Designation", value: profile.designation),
                      const DottedDivider(),
                      InfoRow(title: "Department", value: profile.department),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Image.asset(
                "lib/images/img_4.png",
                height: 250,
                width: 280,
                fit: BoxFit.fill,
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: width / 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF01a0e1),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Start work",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
