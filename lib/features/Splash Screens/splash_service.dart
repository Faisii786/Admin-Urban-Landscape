import 'dart:async';

import 'package:admin_fix_my_ride/bottom_nav_bar.dart';
import 'package:admin_fix_my_ride/features/Authentication/View/Signin/sign_in_screen.dart';
import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void checkUserStatus(BuildContext context) async {
    if (firebaseAuth.currentUser != null) {
      Timer(const Duration(seconds: 3), () async {
        Get.to(() => BottomNavBar());
        ErrorHandler.showSuccessToast("Welcome Back!");
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.to(
          () => const SigninScreen(),
          duration: const Duration(seconds: 2),
          transition: Transition.fade,
        );
      });
    }
  }
}
