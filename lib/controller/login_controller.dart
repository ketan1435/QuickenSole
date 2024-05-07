import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../screens/home_screen.dart';
import '../widgets/custom_snackbar.dart';
class LoginController extends GetxController
{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void >SignIn(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        print("SignIn");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        successSnackBar(message: "Login Successfully",title: "Success");
        // passwordController.clear();
        // emailController.clear();
      }
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      errorSnackBar(message: "Please Enter Valid Credential",title: "Error");
      // passwordController.clear();
      // emailController.clear();
    }
  }
}