import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../screens/home_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp() async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'email': emailController.text.toString(),
        'Pass': passwordController.text.toString(),
        'name': nameController.text.toString(),
        'add': addController.text.toString(),
      });

      clearControllers();
    } catch (e) {
      // Handle errors
      print('Error during sign up: $e');
      // Example: Show a snackbar with the error message
      Get.snackbar("Sign Up Error", "An error occurred during sign up: $e");
    }
  }

  void clearControllers() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    addController.clear();
  }
}
