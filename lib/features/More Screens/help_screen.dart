import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/features/More%20Screens/faqs_screen.dart';
import 'package:admin_fix_my_ride/features/More%20Screens/privacy_policy.dart';
import 'package:admin_fix_my_ride/features/More%20Screens/terms_and_condition_screen.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          text: 'Help',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          ListTile(
            onTap: () {
              Get.to(() => const FAQScreen());
            },
            leading: const Icon(Icons.question_answer, color: Colors.black54),
            title: const CustomText(
              text: 'FAQ',
              txtColor: Colors.black87,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.black54),
            title: const CustomText(
              text: 'Terms & Condition',
              txtColor: Colors.black87,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const TermsConditionsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.black54),
            title: const CustomText(
              text: 'Privacy Policy',
              txtColor: Colors.black87,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.to(() => const PrivacyPolicyScreen());
            },
          ),
        ],
      ),
    );
  }
}
