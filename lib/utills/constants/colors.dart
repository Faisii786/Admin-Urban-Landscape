import 'package:flutter/material.dart';

class AppColors {
  // App Colors
  static Color primaryColor = const Color(0xffE37090);
  static Color secondaryColor = const Color(0xff2F3417);
  static Color primary1 = const Color(0xffD1BE8A);
  static Color primary2 = const Color(0x0ff59e4e);
  static Color whiteColor = const Color(0xffFEFEFE);

  // Grey Combinations
  static Color grey100 = const Color(0xff0F1928);
  static Color grey80 = const Color(0xff27303E);
  static Color grey60 = const Color(0xff3F4753);
  static Color grey40 = const Color(0xff6F757E);
  static Color grey10 = const Color(0xffCFD1D4);
  static Color grey5 = const Color(0xffE7E8E9);

  // Custom Gradient
  static Gradient customGradient = LinearGradient(
    colors: [
      primaryColor,
      const Color(0xffD1BE8A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
