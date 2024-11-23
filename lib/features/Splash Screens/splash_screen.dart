import 'dart:async';
import 'package:admin_fix_my_ride/features/Authentication/View/Wellcome/wellcome_screen.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            Text(
              'Urban Tropical Landscape',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'styFont',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 4,
              width: 80,
              color: AppColors.primary1,
            ),
            const CustomSizedBox(
              height: 0.1,
            ),
            SpinKitPumpingHeart(
              color: AppColors.secondaryColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
