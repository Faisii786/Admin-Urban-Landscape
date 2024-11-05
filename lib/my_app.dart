import 'package:admin_fix_my_ride/features/Splash%20Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fix My Ride',
      home: SplashScreen(),
    );
  }
}
