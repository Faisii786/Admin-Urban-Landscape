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
                'https://i.pinimg.com/originals/21/75/7a/21757af6d0f49c4bc0d46ceb4f51f9e1.jpg',
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
                        text: 'Urban Gardening',
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
                    text: '500 \$',
                    txtColor: Colors.blue,
                    fontSize: 24,
                    textAlign: TextAlign.start,
                  ),
                  CustomSizedBox(
                    height: 0.02,
                  ),
                  CustomText(
                    text:
                        "Transform your outdoor spaces into lush urban gardens with our expert gardening services.\n\nWe'll help you create a green oasis in your urban environment, improving air quality and aesthetics.\n\nPlants and materials are not included.",
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
