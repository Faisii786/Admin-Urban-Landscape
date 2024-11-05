import 'package:admin_fix_my_ride/bottom_nav_bar.dart';
import 'package:admin_fix_my_ride/data/repository/auth_repo.dart';
import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:admin_fix_my_ride/utills/helper/Popups/screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSignupController extends GetxController {
  static AdminSignupController get instance => Get.find();

  GlobalKey<FormState> adminFormKey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  // Variables
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  // Admin Signup
  Future<void> adminSignUp() async {
    try {
      // Start loading animation
      FullScreenLoader.openLoadingDialog(
        'We are processing your information',
        'assets/files/signupAnimtion.json',
      );

      // Step 2: Form validation
      if (!adminFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Step 3: Create admin account
      String? result = await authRepo.createAdminAccount(
          email.text.trim(), password.text.trim(), name.text.toString());

      if (result == 'Success') {
        name.clear();
        email.clear();
        password.clear();

        FullScreenLoader.stopLoading();

        Get.to(() => BottomNavBar());
        // Show success message
        ErrorHandler.showSuccessSnackkbar(
            "Success", "Admin Account is created successfully");

        Get.back();
      } else {
        FullScreenLoader.stopLoading();
        ErrorHandler.showErrorSnackbar('Error');
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      ErrorHandler.showErrorSnackbar(
          'An unexpected error occurred: ${e.toString()}');
    }
  }
}
