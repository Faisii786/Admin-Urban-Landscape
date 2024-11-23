import 'package:admin_fix_my_ride/Common/widgets/custom_button.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text_field.dart';
import 'package:admin_fix_my_ride/features/Services/Controller/service_controller.dart';
import 'package:admin_fix_my_ride/utills/Validation/validations.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddServiceForm extends StatelessWidget {
  const AddServiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const CustomText(
          text: 'Service Form',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.serviceFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Image Picker
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: controller.selectedImage.value == null
                          ? Center(
                              child: Icon(
                                Iconsax.image,
                                size: 50,
                                color: AppColors.grey60,
                              ),
                            )
                          : Image.file(
                              controller.selectedImage.value!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category Dropdown
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value: controller.categories.isNotEmpty &&
                                    controller.selectedCategory.value.isNotEmpty
                                ? controller.selectedCategory.value
                                : null,
                            items: controller.categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedCategory.value = value;
                                controller.isNewCategory.value = false;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: controller.categories.isEmpty
                                  ? 'No categories available'
                                  : 'Select Category',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.add_circle,
                                    color: AppColors.primaryColor),
                                onPressed: () {
                                  controller.isNewCategory.value = true;
                                  controller.newCategoryC.clear();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // New Category TextField
                  if (controller.isNewCategory.value)
                    CustomTextField(
                      hintText: 'Enter New Category',
                      controller: controller.newCategoryC,
                      prefixIcon: Icons.category,
                    ),
                  const SizedBox(height: 16),

                  // Service Name
                  CustomTextField(
                    hintText: 'Service Name',
                    controller: controller.serviceNameC,
                    prefixIcon: Icons.manage_accounts,
                    validator: (value) => customValidations.validateEmptyText(
                        "Service name", value),
                  ),
                  const SizedBox(height: 16),

                  // Price
                  CustomTextField(
                    hintText: '\$ Price',
                    controller: controller.priceC,
                    prefixIcon: Icons.price_change,
                    validator: (value) =>
                        customValidations.validateEmptyText("Price", value),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  CustomTextField(
                    hintText: 'Description',
                    controller: controller.descriptionC,
                    prefixIcon: Icons.description,
                    maxLine: 7,
                    isMaxLine: true,
                    validator: (value) => customValidations.validateEmptyText(
                        "Description", value),
                  ),
                  const SizedBox(height: 16),

                  // Features Section
                  CustomTextField(
                    hintText: 'Enter Feature',
                    controller: controller.featureC,
                    prefixIcon: Icons.featured_play_list,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add, color: AppColors.primaryColor),
                      onPressed: () {
                        if (controller.featureC.text.trim().isNotEmpty) {
                          controller.addFeature();
                        } else {
                          Get.snackbar(
                            'Error',
                            'Feature name cannot be empty',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Dynamically Sized Feature List
                  if (controller.features.isNotEmpty)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.3,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.features.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.check_circle,
                                color: Colors.green),
                            title: Text(controller.features[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => controller.removeFeature(index),
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Add Service Button
                  CustomButton(
                    isLoading: controller.isLoading.value,
                    btnColor: AppColors.primaryColor,
                    txtColor: AppColors.grey5,
                    btnText: 'Add Service',
                    ontap: () {
                      controller.addService();
                    },
                    isOutlined: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
