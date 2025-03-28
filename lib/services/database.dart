import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class DataBaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserDetail(
    Map<String, dynamic> userInfo,
    String userId,
  ) async {
    try {
      await _firestore.collection("users").doc(userId).set(userInfo);
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  UpdateUserWallet(String Id, String amount) async {
    return await FirebaseFirestore.instance.collection("users").doc(Id).update({
      "wallet": amount,
    });
  }
}
