import 'package:flutter/material.dart';

void showSearchDropdown(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Search",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => Align(
      alignment: Alignment.topCenter,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    "05 May 2025",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1 / 2 - 50,
                  ),
                  Card(
                      color: Colors.lightGreen.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: Icon(Icons.send, color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Search History",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              const SizedBox(height: 10),
              Text("Sick Leave..."),
              const SizedBox(height: 8),
              Text("23 May 2025..."),
              const SizedBox(height: 8),
              Text("Casual Leaves.."),
            ],
          ),
        ),
      ),
    ),
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(anim),
        child: child,
      );
    },
  );
}
