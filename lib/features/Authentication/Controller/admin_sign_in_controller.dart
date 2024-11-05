import 'package:admin_fix_my_ride/bottom_nav_bar.dart';
import 'package:admin_fix_my_ride/data/repository/auth_repo.dart';
import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:admin_fix_my_ride/utills/helper/Popups/screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSigninController extends GetxController {
  static AdminSigninController get instance => Get.find();

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> adminSignin() async {
    try {
      FullScreenLoader.openLoadingDialog(
        'We are processing your information',
        'assets/files/signupAnimtion.json',
      );

      if (!signinFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      String? errorMessage = await authRepo.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (errorMessage != 'Success') {
        FullScreenLoader.stopLoading();
        ErrorHandler.showErrorSnackbar(errorMessage ?? 'Login failed');
        return;
      }

      email.clear();
      password.clear();

      FullScreenLoader.stopLoading();
      ErrorHandler.showSuccessSnackkbar('Success', 'Login Successful!');
      Get.to(() => BottomNavBar());
    } catch (e) {
      FullScreenLoader.stopLoading();
      ErrorHandler.showErrorSnackbar(
        'An unexpected error occurred: ${e.toString()}',
      );
    }
  }
}
