import 'package:admin_fix_my_ride/Common/widgets/custom_button.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text_field.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddServiceForm extends StatelessWidget {
  const AddServiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.blue100),
                ),
                child: Center(
                  child: Icon(
                    Iconsax.image,
                    size: 50,
                    color: AppColors.grey60,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: 'Service Name',
              prefixIcon: Icons.manage_accounts,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: '\$ Price',
              prefixIcon: Icons.price_change,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: 'Description',
              prefixIcon: Icons.description,
              maxLine: 7,
              isMaxLine: true,
            ),
            const Spacer(),
            CustomButton(
              btnColor: AppColors.blue100,
              txtColor: AppColors.grey5,
              btnText: 'Add Service',
              ontap: () {},
              isOutlined: false,
            )
          ],
        ),
      ),
    );
  }
}
