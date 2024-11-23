import 'package:admin_fix_my_ride/features/Dashboard%20Screens/Widgets/service_items.dart';
import 'package:admin_fix_my_ride/features/Services/View/all_services.dart';
import 'package:admin_fix_my_ride/features/Services/View/services_full_detail_screen.dart';
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
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const ServicesDetailsScreen());
            },
            child: buildServiceItem(
                "Urban Gardening",
                "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
                false),
          ),
          buildServiceItem(
              "Public Space Design",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Sustainable Landscaping",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Community Parks",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Green Roofs & Walls",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Urban Tree Planting",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Outdoor Lighting Design",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
              false),
          buildServiceItem(
              "Stormwater Management",
              "https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg",
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
