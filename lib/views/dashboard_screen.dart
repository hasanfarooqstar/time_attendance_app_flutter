import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/controllers/auth_controller.dart';
import 'package:time_attendance_app_flutter/controllers/dashboard_controller.dart';
import 'package:time_attendance_app_flutter/views/add_time.dart';
import 'package:time_attendance_app_flutter/views/attendance_list.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardController.getData();
    });
    var userName = authController.getUserName();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("${userName}'s Dashboard", style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
              onPressed: () {
                authController.logOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTime());
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<DashboardController>(builder: (controller) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(AtttendaceData());
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Monthly Hours",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              controller.getHoursFromMiliseconds(controller.currentMonth),
                                              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 0.7),
                                            ),
                                            Text(
                                              "hours",
                                              style: TextStyle(fontSize: 10),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              controller.getMinutesFromMiliseconds(controller.currentMonth),
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white60,
                                                  height: 0.7),
                                            ),
                                            Text(
                                              "min",
                                              style: TextStyle(fontSize: 10),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "view more",
                                        style: TextStyle(fontSize: 10, color: Colors.white60),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Hours",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    if (!controller.loading)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                controller.getHoursFromMiliseconds(controller.todayTime),
                                                style:
                                                    TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 0.7),
                                              ),
                                              Text(
                                                "hours",
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                controller.getMinutesFromMiliseconds(controller.todayTime),
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white60,
                                                    height: 0.7),
                                              ),
                                              Text(
                                                "min",
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "view more",
                                        style: TextStyle(fontSize: 10, color: Colors.white60),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Today's Check IN",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                Text(
                                  "12:12 AM",
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Shift Duration",
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "222",
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "hours",
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "20",
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                        Text("min")
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      style: IconButton.styleFrom(backgroundColor: Colors.teal),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.stop,
                                        color: Colors.white,
                                      ),
                                      style: IconButton.styleFrom(backgroundColor: Colors.teal),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "End Shift",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(AtttendaceData());
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Month Income",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.currentMonthIncome.toStringAsFixed(2),
                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 0.7),
                                  ),
                                  Text(
                                    " PKR",
                                    // style: TextStyle(fontSize: 10),
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 0.7),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "view more",
                              style: TextStyle(fontSize: 10, color: Colors.white60),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
