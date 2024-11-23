import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text_field.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDialog extends StatelessWidget {
  final Widget? widget;
  const CustomDialog({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: widget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: 'Add New Service',
                  fontSize: 20,
                  txtColor: AppColors.grey100,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor),
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
                const SizedBox(height: 20),
                const CustomTextField(
                  hintText: 'Service Name',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CustomText(
                        text: 'Cancel',
                        fontSize: 15,
                        txtColor: AppColors.grey100,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: 'Add Service',
                        fontSize: 15,
                        txtColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
