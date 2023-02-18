import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  saveAttendance() {
    _firebaseServices.addTime(combineDateAndTime(selectedStartDate, selectedStartTime),
        combineDateAndTime(selectedEndDate, selectedEndTime), _auth.currentUser?.uid ?? '-');
    Get.back();
    Get.snackbar("success", "Your data saved successfully");
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
