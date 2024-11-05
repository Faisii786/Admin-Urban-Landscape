import 'package:admin_fix_my_ride/features/Dashboard%20Screens/Widgets/service_items.dart';
import 'package:admin_fix_my_ride/features/Services/all_services.dart';
import 'package:admin_fix_my_ride/features/Services/services_full_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Column DashboardServices() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const ServicesDetailsScreen());
            },
            child: buildServiceItem(
                "Auto Repair",
                "https://th.bing.com/th/id/R.a394d6121d4751d622ddc6a17427c150?rik=oEGFSPKg7xaBoQ&pid=ImgRaw&r=0",
                false),
          ),
          buildServiceItem(
              "Service & Oil",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "Mobile Mechanic",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "Tires Batteries",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "Dent & Paint",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "Sell My Car",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "RTA Car Reg",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          buildServiceItem(
              "Annual Service",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
              false),
          InkWell(
            onTap: () {
              Get.to(() => const AllServices());
            },
            child: buildServiceItem(
                "See All",
                "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
                true),
          ),
        ],
      ),
    ],
  );
}
