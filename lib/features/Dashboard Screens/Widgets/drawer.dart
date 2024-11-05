import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/images.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.blue100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    CustomImages.whiteAppLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'John Doe',
                  fontSize: 18,
                  txtColor: Colors.white,
                ),
                const CustomText(
                  text: 'john.doe@example.com',
                  fontSize: 14,
                  txtColor: Colors.white70,
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildDrawerItem(Icons.car_rental, "Book Now", onTap: () {}),
                buildDrawerItem(Icons.calendar_today, "My Bookings",
                    onTap: () {}),
                buildDrawerItem(Icons.account_circle, "My Account",
                    onTap: () {}),
                buildDrawerItem(Icons.help_outline, "Help & Info",
                    onTap: () {}),
                buildDrawerItem(Icons.star_rate, "Rate App", onTap: () {}),
                buildDrawerItem(Icons.share, "Share App", onTap: () {}),
                buildDrawerItem(Icons.phone, "Contact Us", onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each drawer item
  Widget buildDrawerItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.grey80),
      title: CustomText(
        text: title,
        fontSize: 16,
        txtColor: AppColors.grey80,
      ),
      onTap: onTap,
    );
  }
}
