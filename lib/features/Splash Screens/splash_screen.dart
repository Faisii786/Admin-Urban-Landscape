import 'dart:async';

import 'package:admin_fix_my_ride/features/Authentication/View/Wellcome/wellcome_screen.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/images.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Get.to(() => const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              CustomImages.blueAppLogo,
              width: 200,
              height: 200,
            ),
            const CustomSizedBox(
              height: 0.05,
            ),
            Text(
              'Fix My Ride',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.grey100,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 4,
              width: 80,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
