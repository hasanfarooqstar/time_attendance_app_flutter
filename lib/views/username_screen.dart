import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/controllers/auth_controller.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({super.key});
  TextEditingController _txtController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _txtController,
              decoration: InputDecoration(
                hintText: 'Your Name',
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                authController.setUserName(_txtController.text);
              },
              icon: Icon(Icons.arrow_forward_outlined))
        ],
      )),
    );
  }
}
