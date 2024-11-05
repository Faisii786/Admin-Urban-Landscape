import 'package:admin_fix_my_ride/Common/widgets/custom_back_button.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_button.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text_field.dart';
import 'package:admin_fix_my_ride/features/Authentication/Controller/admin_sign_in_controller.dart';
import 'package:admin_fix_my_ride/features/Authentication/View/Reset%20Password/reset_password.dart';
import 'package:admin_fix_my_ride/features/Authentication/View/Signup/sign_up_screen.dart';
import 'package:admin_fix_my_ride/features/Authentication/View/Wellcome/wellcome_screen.dart';
import 'package:admin_fix_my_ride/utills/Validation/validations.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/images.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminSigninController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blue100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CustomBackButton(
                      ontap: () {
                        Get.to(() => const WelcomeScreen());
                      },
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: 'SIGN IN',
                          txtColor: AppColors.grey5,
                          fontFamily: 'Poppins',
                          fontSize: 24,
                        ),
                        const CustomSizedBox(
                          width: 0.04,
                        ),
                        Image.asset(
                          CustomImages.whiteAppLogo,
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Form(
                key: controller.signinFormKey,
                child: Column(
                  children: [
                    CustomText(
                      text: 'Please sign in to continue',
                      txtColor: AppColors.grey80,
                      fontSize: 18,
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      controller: controller.email,
                      validator: (value) =>
                          customValidations.validateEmail(value),
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility_off,
                      controller: controller.password,
                      validator: (value) =>
                          customValidations.validatePassword(value),
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const ResetPassword());
                        },
                        child: CustomText(
                          text: 'Forgot Password?',
                          txtColor: AppColors.blue100,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const CustomSizedBox(
                      height: 0.05,
                    ),
                    CustomButton(
                      btnText: 'LOGIN',
                      ontap: () async {
                        await controller.adminSignin();
                      },
                      btnColor: AppColors.blue100,
                      txtColor: Colors.white,
                    ),
                    const CustomSizedBox(
                      height: 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don't have an account?",
                          txtColor: AppColors.grey80,
                          fontSize: 14,
                        ),
                        const CustomSizedBox(
                          width: 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const SignupScreen());
                          },
                          child: CustomText(
                            text: "Register here",
                            txtColor: AppColors.blue100,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
