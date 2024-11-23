import 'package:admin_fix_my_ride/Common/widgets/custom_text.dart';
import 'package:admin_fix_my_ride/utills/constants/colors.dart';
import 'package:admin_fix_my_ride/utills/constants/images.dart';
import 'package:flutter/material.dart';

class NoBookingsScreen extends StatelessWidget {
  const NoBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.grey5),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: CustomText(
          text: 'My Bookings',
          txtColor: AppColors.grey5,
          fontSize: 20,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                CustomImages.noBooking,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Sorry! You must be logged in',
                txtColor: Colors.red,
                fontSize: 20,
              ),
              const SizedBox(height: 8),
              const CustomText(
                text: 'Please login to access your booking history',
                txtColor: Colors.black54,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const CustomText(
                  text: 'Sign in',
                  txtColor: Colors.white,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
