// To parse this JSON data, do
//
//     final timeModel = timeModelFromJson(jsonString);

import 'dart:convert';

TimeModel timeModelFromJson(String str) => TimeModel.fromDoc(json.decode(str));

String timeModelToJson(TimeModel data) => json.encode(data.toJson());

class TimeModel {
  TimeModel({
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.hourlyRate,
  });

  int startTime;
  int endTime;
  String date;
  double hourlyRate;

  factory TimeModel.fromDoc(Map<String, dynamic> json) => TimeModel(
        startTime: json["startTime"],
        endTime: json["endTime"],
        date: json["date"],
        hourlyRate: json["hourlyRate"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
        "hourlyRate": hourlyRate,
      };
}
