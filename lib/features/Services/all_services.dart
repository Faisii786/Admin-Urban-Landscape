import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue100,
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
          text: 'All Services',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            buildAllServices(
              "Auto Repair",
              "https://th.bing.com/th/id/R.a394d6121d4751d622ddc6a17427c150?rik=oEGFSPKg7xaBoQ&pid=ImgRaw&r=0",
            ),
            buildAllServices(
              "Service & Oil",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "Mobile Mechanic",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "Tires Batteries",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "Dent & Paint",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "Sell My Car",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "RTA Car Reg",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "Annual Service",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
            buildAllServices(
              "See All",
              "https://specializedtruckandauto.com/wp-content/uploads/engine-repair-scaled.jpeg",
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAllServices(String title, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const CustomSizedBox(
          width: 0.05,
        ),
        CustomText(
          textAlign: TextAlign.center,
          text: title,
          fontSize: 15,
          txtColor: AppColors.grey80,
        ),
      ],
    ),
  );
}
