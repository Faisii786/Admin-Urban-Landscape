// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:sportify/data/services/api_services.dart';
// import 'package:sportify/utills/Errors/Error%20handler/error_handler.dart';
// import 'package:sportify/utills/Errors/Exceptions/firebase_auth_exceptions.dart';
// import 'package:sportify/utills/Errors/Exceptions/firebase_exceptions.dart';
// import 'package:sportify/utills/Errors/Exceptions/platform_exceptions.dart';
// import 'package:sportify/features/Authentication/Model/coach_model.dart';
// import 'package:sportify/features/Authentication/Model/student_model.dart';

// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();

//   ApiServices apiServices = ApiServices();

//   // Varibale dynamically
//   RxMap<String, dynamic> userData = <String, dynamic>{}.obs;
//   RxString userRole = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserRecord();
//     fetchAdminDetails();
//   }

//   Future<void> fetchUserRecord() async {
//     try {
//       final user = await fetchUserDetail();
//       userData.assignAll(user);

//       // Determine the user's role
//       userRole.value = user['role'] ?? '';
//     } catch (e) {
//       userData.clear();
//     }
//   }

//   ///************ Registration Related ************///
//   // Save data to Fire store
//   Future sendStudentRegRequest(Student student, String id) async {
//     try {
//       await apiServices.firestore
//           .collection('Registration Requests')
//           .doc(id)
//           .set(student.toMap());
//     } on FirebaseAuthException catch (e) {
//       throw EFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw EFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw EPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong. Please try again later.';
//     }
//   }

//   // Fetch Student data
//   // Function to fetch student details and convert them to a List of Student objects
//   Stream<List<Student>> fetchStudentDetails() {
//     return FirebaseFirestore.instance
//         .collection('Registration Requests')
//         .where('role', isEqualTo: 'student')
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) {
//               final data = doc.data();
//               try {
//                 return Student.fromMap(data);
//               } catch (e) {
//                 if (kDebugMode) {
//                   print('Error mapping student: $e');
//                 }
//                 return Student();
//               }
//             }).toList());
//   }

//   // Fetch Coach data
//   // Function to fetch coach details and convert them to a List of Student objects
//   Stream<List<Coach>> fetchCoachDetails() {
//     return apiServices.firestore
//         .collection('Registration Requests')
//         .where('role', isEqualTo: 'coach')
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) {
//         // Convert Fires tore Document to a Student object
//         return Coach.fromMap(doc.data())
//           ..id = doc.id; // Set the document ID as the Student ID
//       }).toList();
//     });
//   }

//   // Fetch Admin Detail
//   Future<Map<String, dynamic>> fetchAdminDetails() async {
//     try {
//       QuerySnapshot snapshot = await apiServices.firestore
//           .collection('users')
//           .where('role', isEqualTo: 'admin')
//           .get();

//       if (snapshot.docs.isEmpty) {
//         return {};
//       } else {
//         final data = snapshot.docs[0].data() as Map<String, dynamic>;
//         return data;
//       }
//     } catch (e) {
//       ErrorHandler.showErrorSnackbar(
//           'Failed to fetch admin detail ${e.toString()}');
//       throw Exception("Failed to fetch admin detail: ${e.toString()}");
//     }
//   }

//   // Method to delete a student registration request from Firestore
//   Future deleteRecord(String? id) async {
//     if (id == null || id.isEmpty) {
//       ErrorHandler.showErrorSnackbar('Document ID is invalid.');
//       return;
//     }
//     try {
//       await apiServices.firestore
//           .collection('Registration Requests')
//           .doc(id)
//           .delete();
//       print('Record deleted successfully');
//     } catch (e) {
//       ErrorHandler.showErrorSnackbar(e.toString());
//     }
//   }

//   ///************ Fetch and Display - Dashboard ************///
//   Future<Map<String, dynamic>> fetchUserDetail() async {
//     try {
//       final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
//           await apiServices.firestore
//               .collection('users')
//               .doc(apiServices.firebaseAuth.currentUser?.uid)
//               .get();

//       if (documentSnapshot.exists) {
//         return documentSnapshot.data() ?? {};
//       } else {
//         return {};
//       }
//     } on FirebaseAuthException catch (e) {
//       throw EFirebaseAuthException(e.code).message;
//     } on FirebaseException catch (e) {
//       throw EFirebaseException(e.code).message;
//     } on PlatformException catch (e) {
//       throw EPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Some error occurred';
//     }
//   }

//   // Update data
//   Future<void> updateUserData(Map<String, dynamic> updatedFields) async {
//     try {
//       final userId = apiServices.firebaseAuth.currentUser?.uid;
//       await apiServices.firestore
//           .collection('users')
//           .doc(userId)
//           .update(updatedFields);

//       // Update local user data if necessary
//       final updatedUser = await fetchUserDetail();
//       userData(updatedUser);
//     } catch (e) {
//       throw 'Error updating profile: ${e.toString()}';
//     }
//   }
// }
