import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/controllers/dashboard_controller.dart';
import 'package:time_attendance_app_flutter/models/time_model.dart';
import 'package:time_attendance_app_flutter/services/firebase_services.dart';
import 'package:time_attendance_app_flutter/utils/date_picker_helper.dart';

class AttendanceController extends GetxController {
  FirebaseServices _firebaseServices = FirebaseServices();
  FirebaseAuth _auth = FirebaseAuth.instance;

  DatePickerHelper picker = DatePickerHelper();
  DateTime selectedStartDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  TextEditingController rateTextController = TextEditingController();

  // int hourlyRate = 0;
  int previousHourlyRate = 0;

  saveAttendance() async {
    Get.back();
    await _firebaseServices.addTime(
        combineDateAndTime(selectedStartDate, selectedStartTime),
        combineDateAndTime(selectedEndDate, selectedEndTime),
        _auth.currentUser?.uid ?? '-',
        double.tryParse(rateTextController.text) ?? 0);
    Get.snackbar("success", "Your data saved successfully");
    Get.find<DashboardController>().getData();
  }

  Future<void> _getTodayTotalTime() async {
    var todayTime = 0;
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
    print(todayTime);
  }

  DateTime combineDateAndTime(DateTime dateTime, TimeOfDay timeOfDay) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour, timeOfDay.minute);
  }

  void selectStartDate() async {
    DateTime? picked = await picker.pickDate(currentDate: selectedStartDate);
    if (picked != null) {
      selectedStartDate = picked;
    }
    update();
  }

  void selectEndDate() async {
    DateTime? picked = await picker.pickDate(currentDate: selectedEndDate);
    if (picked != null) {
      selectedEndDate = picked;
    }
    update();
  }

  void selectStartTime() async {
    TimeOfDay? picked = await picker.pickTime(currentTime: selectedStartTime);
    if (picked != null) {
      selectedStartTime = picked;
    }
    update();
  }

  void selectEndTime() async {
    TimeOfDay? picked = await picker.pickTime(currentTime: selectedEndTime);
    if (picked != null) {
      selectedEndTime = picked;
    }
    update();
  }

  void resetData() {
    selectedStartDate = DateTime.now();
    selectedStartTime = TimeOfDay.now();
    selectedEndDate = DateTime.now();
    selectedEndTime = TimeOfDay.now();
    update();
  }
}
