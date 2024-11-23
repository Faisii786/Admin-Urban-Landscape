import 'package:admin_fix_my_ride/features/Dashboard%20Screens/dashboard_screen.dart';
import 'package:admin_fix_my_ride/features/Message%20Screens/chat_screen.dart';
import 'package:admin_fix_my_ride/features/More%20Screens/more_screen.dart';
import 'package:admin_fix_my_ride/features/Our%20Work/View/work_screen.dart';
import 'package:admin_fix_my_ride/features/Profile%20Screens/profile_screen.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController _controller = Get.put(BottomNavController());

  final List<Widget> _screens = [
    const ProfileScreen(),
    const OurWorkScreen(),
    const DashboardScreen(),
    const AdminChatScreen(),
    const MoreScreen(),
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            ),
            child: _screens[_controller.selectedIndex.value],
          )),
      bottomNavigationBar: ConvexAppBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: AppColors.primaryColor,
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.work, title: 'Work'),
          TabItem(icon: Iconsax.main_component, title: ''),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.grid_view, title: 'More'),
        ],
        initialActiveIndex: _controller.selectedIndex.value,
        onTap: (index) => _controller.changeIndex(index),
      ),
    );
  }
}

class BottomNavController extends GetxController {
  var selectedIndex = 2.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
