import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:time_attendance_app_flutter/models/time_model.dart';

class FirebaseServices {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  void createUser(username, uid) {
    users.doc(uid).set({
      "username": username,
      "joiningDate": DateTime.now().millisecondsSinceEpoch,
    });
  }

  void updateUserName(username, uid) {
    users.doc(uid).update({
      "username": username,
    });
  }

  Future<void> addTime(DateTime startTime, DateTime endTime, String userId, double rate) async {
    await users.doc(userId).collection("attendance").add({
      "startTime": startTime.millisecondsSinceEpoch,
      "endTime": endTime.millisecondsSinceEpoch,
      "date": DateFormat("yyyy-MM-dd").format(startTime),
      "hourlyRate": rate,
    });
    void updateTime(DocumentReference docRef, DateTime startTime, DateTime endTime) {
      docRef.update({
        "startTime": startTime.millisecondsSinceEpoch,
        "endTime": endTime.millisecondsSinceEpoch,
        "date": DateFormat("yyyy-MM-dd").format(startTime),
      });
    }
  }

  Future<List<TimeModel>> getSpecificData(int startTime, int endTime, String uid) async {
    List<TimeModel> timeModel = [];
    QuerySnapshot qSnapShot = await users
        .doc(uid)
        .collection("attendance")
        .where("startTime", isGreaterThan: startTime)
        .where("startTime", isLessThan: endTime)
        .orderBy("startTime", descending: true)
        .get();
    qSnapShot.docs.forEach((element) {
      timeModel.add(TimeModel.fromDoc(element.data() as Map<String, dynamic>));
    });
    return timeModel;
  }
}
