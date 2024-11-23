import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/data/repository/auth_repo.dart';
import 'package:admin_fix_my_ride/data/repository/user_repo.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ProfileHeader(),
          SizedBox(height: 16),
          Expanded(child: ProfileMenuList()),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = Get.put(UserRepository());
    final userData = repo.userData;
    return Container(
      width: double.infinity,
      color: AppColors.primaryColor,
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: CustomText(
                text: 'FA',
                txtColor: Colors.black87,
                fontSize: 24,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            CustomText(
              text: userData['name'] ?? 'John',
              txtColor: Colors.white,
              fontSize: 18,
              textAlign: TextAlign.center,
            ),
            CustomText(
              text: userData['email'] ?? 'john@gmail.com',
              txtColor: Colors.white,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        // const ProfileMenuItem(
        //   icon: Icons.edit,
        //   label: 'Edit Profile',
        //   color: Colors.blue,
        // ),
        // const ProfileMenuItem(
        //   icon: Icons.delete,
        //   label: 'Delete Profile',
        //   color: Colors.red,
        // ),
        ProfileMenuItem(
          ontap: () {
            controller.signOutWarningPopup();
          },
          icon: Icons.logout,
          label: 'Logout',
          color: Colors.red,
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? ontap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: CustomText(
        text: label,
        txtColor: Colors.black87,
        fontSize: 16,
        textAlign: TextAlign.start,
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: ontap,
    );
  }
}
