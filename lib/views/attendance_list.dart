import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/controllers/attendance_controller.dart';
import 'package:time_attendance_app_flutter/controllers/dashboard_controller.dart';
import 'package:time_attendance_app_flutter/utils/extentions.dart';

class AtttendaceData extends StatefulWidget {
  const AtttendaceData({super.key});

  @override
  State<AtttendaceData> createState() => _AtttendaceDataState();
}

class _AtttendaceDataState extends State<AtttendaceData> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Attendance Records"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                for (var data in controller.thisMonthList)
                  Container(
                    // height: 50,

                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // set the border radius as per your needs
                      color:
                          Colors.green.withOpacity(0.5), // set the color using the hexadecimal value of the color code
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0), // set the border radius as per your needs
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              // color: Color(0xFF7EA0C0),
                              colors: [
                                Color.fromARGB(255, 59, 163, 62),
                                Color.fromARGB(255, 2, 84, 23),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.startTime.toDateString()),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Text(data.startTime.toTimeString()),
                                  ],
                                ),
                              ),
                              Text("To"),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(data.endTime.toDateString()),
                                    Text(data.endTime.toTimeString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(controller.getHoursFromMiliseconds(data.endTime - data.startTime)),
                                  Text("h "),
                                  Text(controller.getMinutesFromMiliseconds(data.endTime - data.startTime)),
                                  Text("min"),
                                ],
                              ),
                              SizedBox(
                                width: 40,
                                height: 0.5,
                                child: Divider(
                                  height: 1,
                                  color: Colors.blue,
                                  thickness: 1,
                                ),
                              ),
                              Text(
                                "Rs. ${controller.getEarningFromMiliseconds(data.endTime - data.startTime, data.hourlyRate)}",
                                style: TextStyle(
                                  // fontSize: 10,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ));
    });
  }
}
