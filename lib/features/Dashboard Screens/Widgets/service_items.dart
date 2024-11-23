import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';

Widget buildServiceItem(String title, String imagePath, bool last) {
  return Column(
    children: [
      last == true
          ? Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(Icons.arrow_forward,
                  color: AppColors.primaryColor, size: 40),
            )
          : Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
      const CustomSizedBox(
        height: 0.02,
      ),
      CustomText(
        textAlign: TextAlign.center,
        text: title,
        fontSize: 15,
        txtColor: AppColors.grey80,
      ),
    ],
  );
}
