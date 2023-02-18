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
  });

  int startTime;
  int endTime;
  String date;

  factory TimeModel.fromDoc(Map<String, dynamic> json) => TimeModel(
        startTime: json["startTime"],
        endTime: json["endTime"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
      };
}
