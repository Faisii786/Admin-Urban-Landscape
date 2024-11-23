import 'dart:io';
import 'package:admin_fix_my_ride/data/repository/user_repo.dart';
import 'package:admin_fix_my_ride/features/Services/Model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ServicesController extends GetxController {
  static ServicesController get instance => Get.find();

  final GlobalKey<FormState> serviceFormKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController serviceNameC = TextEditingController();
  final TextEditingController priceC = TextEditingController();
  final TextEditingController descriptionC = TextEditingController();
  final TextEditingController featureC = TextEditingController();
  final TextEditingController newCategoryC = TextEditingController();

  var features = <String>[].obs;
  var categories = <String>[].obs;
  var selectedCategory = ''.obs;
  var isNewCategory = false.obs;
  var isLoading = false.obs;
  var selectedImage = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void addFeature() {
    if (featureC.text.isNotEmpty) {
      features.add(featureC.text.trim());
      featureC.clear();
    } else {
      Get.snackbar('Error', 'Feature cannot be empty');
    }
  }

  void removeFeature(int index) {
    features.removeAt(index);
  }

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> fetchCategories() async {
    try {
      final querySnapshot = await _firestore.collection('Services').get();

      if (querySnapshot.docs.isEmpty) {
        categories.value = [];
      } else {
        categories.value = querySnapshot.docs.map((doc) => doc.id).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories: $e');
    }
  }

  Future<void> addService() async {
    try {
      isLoading.value = true;

      if (!serviceFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      String serviceId = _firestore.collection('Services').doc().id;
      String categoryName = isNewCategory.value
          ? newCategoryC.text.trim()
          : selectedCategory.value;

      if (isNewCategory.value && !categories.contains(categoryName)) {
        categories.add(categoryName);
      }

      final repo = Get.put(UserRepository());
      final data = repo.userData;

      final serviceData = ServiceModel(
        serviceId: serviceId,
        serviceName: serviceNameC.text.trim(),
        price: double.parse(priceC.text.trim()),
        description: descriptionC.text.trim(),
        features: features.toList(),
        userId: data['id'] ?? '',
        userEmail: data['email'] ?? '',
        categoryName: categoryName,
        userName: data['name'] ?? '',
        imageUrl: '',
        dateTime: DateTime.now(),
      );

      await _firestore
          .collection('Services')
          .doc(categoryName)
          .collection('Subcategories')
          .doc(serviceId)
          .set(serviceData.toJson());

      serviceNameC.clear();
      priceC.clear();
      descriptionC.clear();
      features.clear();
      selectedImage.value = null;
      newCategoryC.clear();

      await fetchCategories();

      Get.snackbar('Success', 'Service added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add service: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> uploadImage(String serviceId) async {
    try {
      final ref = _storage.ref().child('service_images/$serviceId.jpg');
      await ref.putFile(selectedImage.value!);
      return await ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      return null;
    }
  }
}
