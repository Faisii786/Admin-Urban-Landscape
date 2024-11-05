import 'dart:async';
import 'package:admin_fix_my_ride/features/Authentication/Model/admin_model.dart';
import 'package:admin_fix_my_ride/features/Authentication/View/Signin/sign_in_screen.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/firebase_auth_exceptions.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/firebase_exceptions.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/platform_exceptions.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> createAdminAccount(
      String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final adminData = AdminModel(
        id: uid,
        name: name,
        email: email,
        password: password,
        createdAt: time,
        lastActive: time,
        role: 'admin',
        status: 'active',
        pushToken: '',
        profilePic: '',
        gender: '',
        phoneNumber: '',
        dateOfBirth: '',
      );

      await _firestore.collection('users').doc(uid).set(adminData.toMap());

      return 'Success';
    } catch (e) {
      return handleException(e);
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } catch (e) {
      return handleException(e);
    }
  }

  Future<String?> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'An email has been sent to reset the password';
    } catch (e) {
      return handleException(e);
    }
  }

  void signOutWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(Sizes.md),
      title: 'Sign out',
      middleText: 'Are you sure you want to sign out of your account?',
      confirm: ElevatedButton(
        onPressed: () async => await logout(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.lg),
          child: Text(
            'Sign out',
            style: TextStyle(color: AppColors.grey5),
          ),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  Future<String?> logout() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAll(() => const SigninScreen());
      return 'Logged out successfully';
    } catch (e) {
      return handleException(e);
    }
  }

  String? handleException(Object e) {
    if (e is FirebaseAuthException) {
      return EFirebaseAuthException(e.code).message;
    } else if (e is FirebaseException) {
      return EFirebaseException(e.code).message;
    } else if (e is PlatformException) {
      return EPlatformException(e.code).message;
    } else {
      return 'Something went wrong. Please try again later.';
    }
  }
}
