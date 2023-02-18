import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/controllers/attendance_controller.dart';
import 'package:time_attendance_app_flutter/services/firebase_services.dart';
import '../utils/extentions.dart';

class AddTime extends StatelessWidget {
  AddTime({super.key});
  final AttendanceController attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attendanceController.resetData();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Add Shift Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<AttendanceController>(builder: (controller) {
          return Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shit Start",
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
                        // textAlign: TextAlign.start,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                controller.selectStartDate();
                              },
                              child: Text(controller.selectedStartDate == null
                                  ? "Select Date"
                                  : controller.selectedStartDate.customParse())),
                          InkWell(
                              onTap: () {
                                controller.selectStartTime();
                              },
                              child: Text(controller.selectedStartTime == null
                                  ? "Select Time"
                                  : controller.selectedStartTime.to12hours()))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shit End",
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
                        // textAlign: TextAlign.start,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () async {
                                controller.selectEndDate();
                              },
                              child: Text(controller.selectedEndDate == null
                                  ? "Select Date"
                                  : controller.selectedEndDate.customParse())),
                          InkWell(
                              onTap: () async {
                                controller.selectEndTime();
                              },
                              child: Text(controller.selectedEndTime == null
                                  ? "Select Time"
                                  : controller.selectedEndTime.to12hours()))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                label: Text("SAVE Shift"),
                onPressed: () {
                  controller.saveAttendance();
                },
                icon: Icon(Icons.check),
              )
            ],
          );
        }),
      ),
    );
  }
}
