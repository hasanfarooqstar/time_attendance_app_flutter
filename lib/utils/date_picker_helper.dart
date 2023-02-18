import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerHelper {
  Future<DateTime?> pickDate({DateTime? currentDate}) async {
    return await showDatePicker(
        context: Get.context!,
        initialDate: currentDate ?? DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2100));
  }

  Future<TimeOfDay?> pickTime({TimeOfDay? currentTime}) async {
    return await showTimePicker(context: Get.context!, initialTime: currentTime ?? TimeOfDay.now());
  }
}
