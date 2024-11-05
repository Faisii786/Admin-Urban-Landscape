class customTexts {
  // OnBoarding Screens title
  static String onBoardingTitle1 = 'Stay Connected, Stay Ahead';
  static String onBoardingTitle2 = 'Lead with Precision';
  static String onBoardingTitle3 = 'Effortless Management';

  // OnBoarding Screens Descriptions
  static String onBoardingsubTitle1 =
      'Elevate your experience with Sportify. Everything you need, all in one place.';
  static String onBoardingsubTitle2 =
      'Track progress, manage schedules, and guide your team to victory.Automate your coaching journey with Sportify.';
  static String onBoardingsubTitle3 =
      'Oversee all activities, streamline operations, and ensure everything runs smoothly. Sportify is your command center.';

  // Method to get the greeting message based on the current time
  static String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning!';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon!';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening!';
    } else {
      return 'Good Night!';
    }
  }
}
