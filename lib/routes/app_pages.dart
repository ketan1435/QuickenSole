import 'package:get/get_navigation/get_navigation.dart';
import 'package:quicknsole_assesment/binding/home_binding.dart';
import 'package:quicknsole_assesment/binding/login_binding.dart';
import 'package:quicknsole_assesment/binding/sign_up_binding.dart';
import 'package:quicknsole_assesment/binding/splash_binding.dart';
import 'package:quicknsole_assesment/routes/app_routs.dart';
import 'package:quicknsole_assesment/screens/home_screen.dart';
import 'package:quicknsole_assesment/screens/login_screen.dart';
import 'package:quicknsole_assesment/screens/sign_up_screen.dart';
import 'package:quicknsole_assesment/screens/splash_screen.dart';

class AppPages
{
  static String INITIAL_ROUTE = AppRouts.SPLASH_ROUTE;
  static final pages =
  [
   GetPage(
       name: AppRouts.LOGIN_ROUTE,
       page:()=> LoginScreen(),
       binding:LoginBindings()
   ),
    GetPage(
        name: AppRouts.SIGN_UP_ROUTE,
        page:()=> SignUpScreen(),
        binding:SignUpBinding()
    ),
    GetPage(
        name: AppRouts.HOME_ROUTE,
        page:()=> HomeScreen(),
        binding:HomeBinding()
    ),
    GetPage(
        name: AppRouts.SPLASH_ROUTE,
        page:()=> SplashScreen(),
        binding:SplashBinding()
    ),
  ];
}