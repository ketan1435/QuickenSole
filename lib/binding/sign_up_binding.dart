import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quicknsole_assesment/controller/sign_up_controller.dart';
class SignUpBinding extends Bindings
{
  @override
  void dependencies() {
   Get.lazyPut(() => SignUpController());
  }
}