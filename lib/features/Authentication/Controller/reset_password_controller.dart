import 'package:admin_fix_my_ride/data/repository/auth_repo.dart';
import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:admin_fix_my_ride/utills/helper/Popups/screen_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  GlobalKey<FormState> resetFormkey = GlobalKey<FormState>();

  final authRepo = Get.put(AuthenticationRepository());

  final email = TextEditingController();

  // Student Signup
  void resetPassword() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog('We are processing your information',
          'assets/files/processignAnimation.json');

      // Form validation
      if (!resetFormkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // check email is exist or not
      String formattedEmail = email.text.trim().toLowerCase();
      QuerySnapshot emailSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: formattedEmail)
          .get();
      if (emailSnapshot.docs.isEmpty) {
        FullScreenLoader.stopLoading();
        ErrorHandler.showErrorSnackbar('Email does not exist! 🙂');
        return;
      }
      if (formattedEmail.isEmpty) {
        FullScreenLoader.stopLoading();
      } else if (formattedEmail.isNotEmpty) {
        await authRepo.resetPassword(email: formattedEmail).then((value) {
          email.clear();
          FullScreenLoader.stopLoading();
        });
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      ErrorHandler.showErrorSnackbar('Some error occurred: ${e.toString()}');
    }
  }
}
