import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? ontap;
  final Color? btnColor;
  final Color? txtColor;
  final bool isOutlined;
  final bool? isLoading;

  const CustomButton({
    super.key,
    this.btnText,
    this.ontap,
    this.btnColor,
    this.txtColor,
    this.isOutlined = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.transparent
              : (btnColor ?? AppColors.secondaryColor),
          border: isOutlined
              ? Border.all(
                  color: btnColor ?? AppColors.secondaryColor, width: 1)
              : null,
          borderRadius: BorderRadius.circular(200),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Center(
            child: isLoading == true
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )
                : Text(
                    btnText ?? 'LOG IN',
                    style: TextStyle(
                      fontFamily: 'headingFont',
                      color: isOutlined
                          ? (btnColor ?? AppColors.secondaryColor)
                          : (txtColor ?? AppColors.whiteColor),
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
