import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/features/Dashboard%20Screens/Widgets/build_analytics.dart';
import 'package:admin_fix_my_ride/features/Services/service_form.dart';
import 'package:admin_fix_my_ride/features/Dashboard%20Screens/Widgets/dashboard_services.dart';
import 'package:admin_fix_my_ride/features/Dashboard%20Screens/Widgets/drawer.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.grey5),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: CustomText(
          text: 'Urban Tropical Landscape',
          txtColor: AppColors.grey5,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: AppColors.grey10,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: ' Analytics',
                      txtColor: AppColors.grey80,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildAnalyticsCard(
                            'Total Services', '120', Icons.build),
                        buildAnalyticsCard('Pending', '45', Icons.pending),
                        buildAnalyticsCard('Completed', '75', Icons.done),
                      ],
                    ),
                    const CustomSizedBox(
                      height: 0.05,
                    ),
                    CustomText(
                      text: 'Manage Services',
                      txtColor: AppColors.grey80,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                    ),
                    DashboardServices(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Get.to(() => const AddServiceForm()),
        child: Icon(
          Iconsax.add,
          color: AppColors.grey5,
          size: 35,
        ),
      ),
    );
  }
}
