import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_attendance_ui/View/Auth_View/Login_Page.dart';
import 'package:ziya_attendance_ui/View/MainNavigationPage.dart';
import 'package:ziya_attendance_ui/controller/Shared_Preference_Helper.dart';
import 'package:ziya_attendance_ui/models/CheckIn_Model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final SharedPreferenceHelper prefs = SharedPreferenceHelper();
  final bool isLoggedIn = await prefs.isLoggedIn();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CheckInModel()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: isLoggedIn ? const MainNavigationPage() : const LoginPage(),
    );
  }
}
