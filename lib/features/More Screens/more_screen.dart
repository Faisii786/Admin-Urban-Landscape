import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/features/More%20Screens/help_screen.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: const CustomText(
          text: 'More',
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
              Get.to(() => const HelpScreen());
            },
            leading: const Icon(Icons.info, color: Colors.black54),
            title: const CustomText(
              text: 'Help & Info',
              txtColor: Colors.black54,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.star, color: Colors.black54),
            title: CustomText(
              text: 'Rate App',
              txtColor: Colors.black54,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.share, color: Colors.black54),
            title: CustomText(
              text: 'Share App',
              txtColor: Colors.black54,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.phone, color: Colors.black54),
            title: CustomText(
              text: 'Contact Us',
              txtColor: Colors.black54,
              fontSize: 16,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
