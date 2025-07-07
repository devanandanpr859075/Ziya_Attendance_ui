// import 'package:flutter/material.dart';
// import 'package:ziya_attendance_ui/View/History_Page.dart';
// import 'package:ziya_attendance_ui/View/Home_Page.dart';
// import 'package:ziya_attendance_ui/View/Leave_page.dart';
// import 'package:ziya_attendance_ui/View/Profile_Page.dart';
// import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';
//
// class MainNavigationPage extends StatefulWidget {
//   const MainNavigationPage({super.key});
//
//   @override
//   State<MainNavigationPage> createState() => _MainNavigationPageState();
// }
//
// class _MainNavigationPageState extends State<MainNavigationPage> {
//   int _currentIndex = 0;
//
//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//
//   final List<Widget> _screens = const [
//     HomePage(),
//     HistoryPage(),
//     LeavePage(),
//     ProfilePage(),
//   ];
//
//   Widget _buildOffstageNavigator(int index) {
//     return Offstage(
//       offstage: _currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (RouteSettings settings) {
//           return MaterialPageRoute(
//             builder: (_) => _screens[index],
//             settings: settings,
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvoked: (didPop) async {
//         if (didPop) return;
//
//         final NavigatorState currentNavigator =
//         _navigatorKeys[_currentIndex].currentState!;
//
//         final isFirstRouteInCurrentTab = !await currentNavigator.maybePop();
//         if (isFirstRouteInCurrentTab) {
//           if (_currentIndex != 0) {
//             setState(() {
//               _currentIndex = 0;
//             });
//           } else {
//             // Exit app or do nothing
//           }
//         }
//       },
//       child: Scaffold(
//         body: Stack(
//           children: List.generate(
//             _screens.length,
//                 (index) => _buildOffstageNavigator(index),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           currentIndex: _currentIndex,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: AppColors.primaryColor,
//           unselectedItemColor: Colors.grey,
//           onTap: (index) {
//             if (_currentIndex == index) {
//               final currentNavigator = _navigatorKeys[index].currentState!;
//               if (currentNavigator.canPop()) {
//                 currentNavigator.popUntil((route) => route.isFirst);
//               }
//             } else {
//               setState(() {
//                 _currentIndex = index;
//               });
//             }
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_rounded),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.list_alt_rounded),
//               label: 'History',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.arrow_circle_right),
//               label: 'Leave',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ziya_attendance_ui/View/History_Page.dart';
import 'package:ziya_attendance_ui/View/Home_Page.dart';
import 'package:ziya_attendance_ui/View/Leave_page.dart';
import 'package:ziya_attendance_ui/View/Profile_Page.dart';
import 'package:ziya_attendance_ui/constants/Color%20Constants.dart';


class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    HistoryPage(),
    LeavePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor:Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right),
            label: 'Leave',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}