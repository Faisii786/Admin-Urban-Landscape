import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

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
          text: "FAQ'S",
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          CustomExpansionTile(
            text: 'How much do you charge?',
            expText: 'The price depends on the service...',
          ),
          CustomExpansionTile(
            text: 'How long will it take?',
            expText: 'The duration varies based on the service...',
          ),
          CustomExpansionTile(
            text: 'What is the refund policy?',
            expText: 'Refunds are processed within 7 days...',
          ),
          CustomExpansionTile(
            text: 'Do you collect the car?',
            expText: 'Yes, we offer collection services...',
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String text;
  final String expText;
  const CustomExpansionTile({
    super.key,
    required this.text,
    required this.expText,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: CustomText(
        text: text,
        txtColor: Colors.black87,
        fontSize: 16,
        textAlign: TextAlign.start,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomText(
            text: expText,
            txtColor: Colors.black54,
            fontSize: 14,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
