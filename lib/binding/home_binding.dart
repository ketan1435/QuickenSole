import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:quicknsole_assesment/controller/home_controller.dart';

class HomeBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() =>HomeController() );
  }
}