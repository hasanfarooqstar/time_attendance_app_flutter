import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_attendance_app_flutter/controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Obx(() {
            return authController.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: (() {
                      authController.loginWithGoogle();
                    }),
                    child: Text("Sign in with Google"),
                  );
          }),
        ),
      ),
    );
  }
}
