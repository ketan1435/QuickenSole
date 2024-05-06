import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quicknsole_assesment/screens/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2));
    Timer(
      Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade400,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(child: Text("QuickenSole Industries",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 30),))
        ],
      ),
    );
  }
}
