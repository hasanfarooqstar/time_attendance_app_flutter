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

  void addTime(DateTime startTime, DateTime endTime, String userId) {
    users.doc(userId).collection("attandance").add({
      " startTime": startTime.millisecondsSinceEpoch,
      "endTime": endTime.millisecondsSinceEpoch,
      "date": DateFormat("yyyy-MM-dd").format(startTime),
    });
    void updateTime(DocumentReference docRef, DateTime startTime, DateTime endTime) {
      docRef.update({
        " startTime": startTime.millisecondsSinceEpoch,
        "endTime": endTime.millisecondsSinceEpoch,
        "date": DateFormat("yyyy-MM-dd").format(startTime),
      });
    }
  }

  Future<List<TimeModel>> getSpecificData(int startTime, int endTime, String uid) async {
    List<TimeModel> timeModel = [];
    QuerySnapshot qSnapShot = await users
        .doc(uid)
        .collection("attandance")
        .where("startTime", isGreaterThan: startTime)
        .where("startTime", isLessThan: endTime)
        .orderBy("startTime")
        .get();
    qSnapShot.docs.forEach((element) {
      timeModel.add(TimeModel.fromDoc(element.data() as Map<String, dynamic>));
    });
    return timeModel;
  }
}
