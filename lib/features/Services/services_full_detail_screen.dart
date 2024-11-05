import 'package:admin_fix_my_ride/Common/widgets/custom_back_button.dart';
import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/size_box.dart';
import 'package:flutter/material.dart';

class ServicesDetailsScreen extends StatelessWidget {
  const ServicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                'https://th.bing.com/th/id/R.a394d6121d4751d622ddc6a17427c150?rik=oEGFSPKg7xaBoQ&pid=ImgRaw&r=0',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const Positioned(
                top: 30,
                left: 16,
                child: CustomBackButton(),
              ),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Brake Repair',
                        txtColor: Colors.black87,
                        fontSize: 18,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.black54),
                          SizedBox(width: 4),
                          CustomText(
                            text: '5h 0m',
                            txtColor: Colors.black54,
                            fontSize: 14,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomSizedBox(
                    height: 0.02,
                  ),
                  CustomText(
                    text: '700 \$',
                    txtColor: Colors.blue,
                    fontSize: 24,
                    textAlign: TextAlign.start,
                  ),
                  CustomSizedBox(
                    height: 0.02,
                  ),
                  CustomText(
                    text:
                        "It's time to inspect your car brakes which is the most important part in the car considering Safety.\n\nBook the service and let us check and repair your car brakes.\n\nParts not included.",
                    txtColor: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
