import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_attendance_app_flutter/views/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_attendance_app_flutter/views/sign_in.dart';
import 'package:time_attendance_app_flutter/views/username_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: FirebaseAuth.instance.currentUser != null
          ? (FirebaseAuth.instance.currentUser?.displayName ?? "") == ""
              ? UserNameScreen()
              : DashboardScreen()
          : SignInScreen(),
    );
  }
}
