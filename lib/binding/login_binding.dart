import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quicknsole_assesment/controller/login_controller.dart';

class LoginBindings extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }
}