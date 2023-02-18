import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CustomDateFormat on DateTime {
  String customParse() {
    return DateFormat('dd MMM, yyyy').format(this);
  }
}

// extension CustomTimeFormat on TimeOfDay {
//   String customParse() {
//     return "${this.hourOfPeriod} : ${this.minute} ${this.}";
//   }
// }
extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  String to12hours() {
    final hour = this.hourOfPeriod.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:$min $period";
  }
}
