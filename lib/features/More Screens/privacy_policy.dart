import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          text: 'Privacy Policy',
          txtColor: Colors.white,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomText(
          text:
              '''Fix My Ride ("We") are committed to protecting and respecting your privacy.


This policy (together with our terms of use and any other documents referred to therein) sets out the basis on which any personal data we collect from you, or that you provide to us, will be processed by us. Please read the following carefully to understand our views and practices regarding your personal data and how we will treat it.


We may collect and process the following data about you:
Information that you provide by filling in forms on our site/app Fix My Ride. This includes information provided at the time of registering to use our site, subscribing to our service, posting material or requesting further services. We may also ask you for information [when you enter a competition or promotion sponsored by Fix My Ride, and when you report a problem with our site.
If you contact us, we may keep a record of that correspondence.
We may also ask you to complete surveys that we use for research purposes, although you do not have to respond to them.
Details of transactions you carry out through our site and of the fulfilment of your orders.


Details of your visits to our site including, but not limited to, traffic data, location data, weblogs and other communication data, whether this is required for our own billing purposes or otherwise and the resources that you access.
          ''',
          txtColor: Colors.black87,
          fontSize: 14,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
