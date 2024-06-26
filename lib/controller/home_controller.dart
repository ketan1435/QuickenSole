import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> deleteUser(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(documentId).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<void> updateUser(String documentId, Map<String, dynamic> newData) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(documentId).update(newData);
    } catch (e) {
      print('Error updating user: $e');
    }
  }
}
