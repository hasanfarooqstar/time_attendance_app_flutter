import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/models/time_model.dart';
import 'package:time_attendance_app_flutter/services/firebase_services.dart';

class DashboardController extends GetxController {
  int todayTime = 0;
  int currentMonth = 0;
  double currentMonthIncome = 0;
  bool loading = false;
  List<TimeModel> thisMonthList = [];

  getData() async {
    try {
      loading = true;
      update();
      await _getTodayTotalTime();
      await _getCurrentMonthTime();
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }

  Future<void> _getCurrentMonthTime() async {
    thisMonthList.clear();
    currentMonth = 0;
    currentMonthIncome = 0;
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(
      now.year,
      now.month,
    );

    DateTime endTime = DateTime(
      now.year,
      now.month + 1,
    );
    // print(endTime);

    List<TimeModel> totalTimeList = await FirebaseServices().getSpecificData(startTime.millisecondsSinceEpoch,
        endTime.millisecondsSinceEpoch, FirebaseAuth.instance.currentUser?.uid ?? "-");
    thisMonthList.addAll(totalTimeList);
    totalTimeList.forEach((element) {
      currentMonthIncome += element.hourlyRate * ((element.endTime - element.startTime) / 3600000);
      int _slotTime = element.endTime - element.startTime;
      currentMonth += _slotTime;
    });
    print(currentMonth);
  }

  Future<void> _getTodayTotalTime() async {
    todayTime = 0;
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day);
    DateTime nextDayTime = now.add(Duration(days: 1));

    DateTime endTime = DateTime(nextDayTime.year, nextDayTime.month, nextDayTime.day);

    List<TimeModel> totalTimeList = await FirebaseServices().getSpecificData(startTime.millisecondsSinceEpoch,
        endTime.millisecondsSinceEpoch, FirebaseAuth.instance.currentUser?.uid ?? "-");

    totalTimeList.forEach((element) {
      int _slotTime = element.endTime - element.startTime;
      todayTime += _slotTime;
    });
    // print(todayTime);
  }

  String getHoursFromMiliseconds(int miliseconds) {
    double tempMinutes = miliseconds / 60000;
    int hour = tempMinutes ~/ 60;
    return "${hour}";
  }

  String getEarningFromMiliseconds(int miliseconds, double hourlyRate) {
    int tempMinutes = miliseconds ~/ 60000;
    int hour = tempMinutes ~/ 60;
    int minutes = tempMinutes % 60;
    double oneMinuteRate = hourlyRate / 60;

    double totalEarning = ((hour * hourlyRate) + (minutes * oneMinuteRate));
    return totalEarning.toStringAsFixed(2);
  }

  String getMinutesFromMiliseconds(int miliseconds) {
    int tempMinutes = miliseconds ~/ 60000;
    int minutes = tempMinutes % 60;
    return "${minutes}";
  }
}
