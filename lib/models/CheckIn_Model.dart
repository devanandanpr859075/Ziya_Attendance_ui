import 'package:flutter/foundation.dart';

class CheckInModel extends ChangeNotifier {
  bool isCheckedIn = false;
  bool isWFH = false;
  String? checkInTime;
  String? checkOutTime;

  void checkIn(String time, bool fromHome) {
    isCheckedIn = true;
    isWFH = fromHome;
    checkInTime = time;
    notifyListeners();
  }

  void checkOut(String time) {
    isCheckedIn = false;
    checkOutTime = time;
    notifyListeners();
  }
}