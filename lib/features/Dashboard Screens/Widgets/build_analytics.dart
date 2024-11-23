import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

Widget buildAnalyticsCard(String title, String value, IconData icon) {
  return Container(
    width: 110,
    height: 130,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 30),
        const SizedBox(height: 15),
        CustomText(
          text: value,
          fontSize: 16,
          txtColor: AppColors.primaryColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        CustomText(
          text: title,
          fontSize: 12,
          txtColor: AppColors.grey80,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
