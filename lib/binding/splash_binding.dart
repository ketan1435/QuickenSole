import 'package:get/get.dart';
import 'package:quicknsole_assesment/controller/splash_controller.dart';

class SplashBinding extends Bindings
{
  @override
  void dependencies() {
  Get.lazyPut(() => SplashController());
  }
}