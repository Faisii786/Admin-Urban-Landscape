import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Image Picker/image_picker_controller.dart';
import '../constants/colors.dart';

class ImagePickerScreen extends StatelessWidget {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blue100),
        ),
        child: InkWell(
          onTap: () {
            imagePickerController.pickImage();
          },
          child: imagePickerController.selectedImagePath.value.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: AppColors.blue100,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Upload Image",
                      style: TextStyle(
                        color: AppColors.grey100,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.center, // Center the text
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(imagePickerController.selectedImagePath.value),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black45, // Semi-transparent background
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: const Text(
                        "Change Image",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
