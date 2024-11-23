import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? txtColor;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;

  const CustomText({
    super.key,
    this.text,
    this.txtColor,
    this.fontFamily,
    this.fontSize,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Welcome To Urban Tropical Landscape',
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily ?? 'bodyFont',
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.w500,
        color: txtColor ?? AppColors.primaryColor,
      ),
    );
  }
}
