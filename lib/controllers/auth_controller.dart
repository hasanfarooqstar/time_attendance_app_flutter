import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_attendance_app_flutter/services/firebase_services.dart';
import 'package:time_attendance_app_flutter/views/dashboard_screen.dart';
import 'package:time_attendance_app_flutter/views/sign_in.dart';
import 'package:time_attendance_app_flutter/views/username_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  FirebaseServices _firebaseServices = FirebaseServices();

  RxBool loading = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginWithGoogle() async {
    try {
      loading.value = true;
      await _googleSignIn.signOut();
      GoogleSignInAccount? signed = await _googleSignIn.signIn();
      if (signed != null) {
        GoogleSignInAuthentication gAuth = await signed.authentication;
        OAuthCredential credential =
            GoogleAuthProvider.credential(idToken: gAuth.idToken, accessToken: gAuth.accessToken);
        UserCredential userData = await _auth.signInWithCredential(credential);
        if (userData.user != null) {
          _firebaseServices.createUser(userData.user?.displayName ?? "", userData.user?.uid ?? "");
          if ((userData.user?.displayName ?? "") == "") {
            Get.off(() => UserNameScreen());
          } else {
            Get.off(() => DashboardScreen());
          }
          //goto next p
        }
      }
      loading.value = false;
    } catch (error) {
      print(error);
      loading.value = false;
      Get.snackbar("error", error.toString());
    }
    // FirebaseFirestore.instance.collection('abc').add({'test data': 'wow'});
  }

  setUserName(String name) {
    _firebaseServices.createUser(name, _auth.currentUser?.uid ?? "-");
    if (_auth.currentUser != null) {
      _auth.currentUser?.updateDisplayName(name);
      Get.off(() => DashboardScreen());
    }
  }

  getUserName() {
    return _auth.currentUser?.displayName ?? "";
  }

  logOut() {
    _auth.signOut();
    _googleSignIn.signOut();
    Get.offAll(() => SignInScreen());
  }
}
