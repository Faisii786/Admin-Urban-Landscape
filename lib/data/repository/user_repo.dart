import 'package:admin_fix_my_ride/utills/Errors/Error%20handler/error_handler.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/firebase_auth_exceptions.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/firebase_exceptions.dart';
import 'package:admin_fix_my_ride/utills/Errors/Exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final RxMap<String, dynamic> userData = RxMap<String, dynamic>();
  RxString userRole = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    fetchAdminDetails();
    fetchUserDetail();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await fetchUserDetail();
      userData.assignAll(user);
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  // Fetch Admin Detail
  Future<Map<String, dynamic>> fetchAdminDetails() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('users')
          .where('role', isEqualTo: 'admin')
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return {};
      } else {
        final data = snapshot.docs[0].data() as Map<String, dynamic>;
        return data;
      }
    } catch (e) {
      ErrorHandler.showErrorSnackbar(
          'Failed to fetch admin detail: ${e.toString()}');
      throw Exception("Failed to fetch admin detail: ${e.toString()}");
    }
  }

  // Fetch all users with role = "user"
  Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('users')
          .where('role', isEqualTo: 'user')
          .get();

      if (snapshot.docs.isEmpty) {
        return [];
      } else {
        return snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      }
    } catch (e) {
      ErrorHandler.showErrorSnackbar('Failed to fetch users: ${e.toString()}');
      return [];
    }
  }

  ///************ Fetch Current User ************///
  Future<Map<String, dynamic>> fetchUserDetail() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data() ?? {};
      } else {
        return {};
      }
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Some error occurred';
    }
  }
}
