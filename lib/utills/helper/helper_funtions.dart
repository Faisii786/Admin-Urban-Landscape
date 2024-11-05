import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  /// Shows a Snackbar with the given [message].
  ///
  /// Example usage:
  /// ```dart
  /// THelperFunctions.showSnackBar('This is a Snackbar message!');
  /// ```
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Format user ID
  static String formatId(String id) {
    if (id.length < 8) return id;
    return '${id.substring(0, 4)}-${id.substring(id.length - 4)}';
  }

  /// Shows an AlertDialog with the given [title] and [message].
  ///
  /// Example usage:
  /// ```dart
  /// THelperFunctions.showAlert('Alert', 'This is an alert message.');
  /// ```
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  //get last message time (used in chat user card)
  static String getLastMessageTime(
      {required BuildContext context,
      required String time,
      bool showYear = false}) {
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();

    if (now.day == sent.day &&
        now.month == sent.month &&
        now.year == sent.year) {
      return TimeOfDay.fromDateTime(sent).format(context);
    }

    return showYear
        ? '${sent.day} ${_getMonth(sent)} ${sent.year}'
        : '${sent.day} ${_getMonth(sent)}';
  }

  //get formatted last active time of user in chat screen
  static String getLastActiveTime(
      {required BuildContext context, required String lastActive}) {
    final int i = int.tryParse(lastActive) ?? -1;

    //if time is not available then return below statement
    if (i == -1) return 'Last seen not available';

    DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == time.year) {
      return 'Last seen today at $formattedTime';
    }

    if ((now.difference(time).inHours / 24).round() == 1) {
      return 'Last seen yesterday at $formattedTime';
    }

    String month = _getMonth(time);

    return 'Last seen on ${time.day} $month on $formattedTime';
  }

  // get month name from month no. or index
  static String _getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'NA';
  }

  /// Navigates to the specified [screen].
  ///
  /// Example usage:
  /// ```dart
  /// THelperFunctions.navigateToScreen(context, MyNewScreen());
  /// ```
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Truncates the given [text] to [maxLength] characters and appends "..." if truncated.
  ///
  /// Example usage:
  /// ```dart
  /// String truncated = THelperFunctions.truncateText('This is a long text', 10);
  /// ```
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /// Returns true if the current theme is dark mode.
  ///
  /// Example usage:
  /// ```dart
  /// bool isDarkMode = THelperFunctions.isDarkMode(context);
  /// ```
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Returns the size of the screen.
  ///
  /// Example usage:
  /// ```dart
  /// Size screenSize = THelperFunctions.screenSize();
  /// ```
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Returns the height of the screen.
  ///
  /// Example usage:
  /// ```dart
  /// double height = THelperFunctions.screenHeight();
  /// ```
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Returns the width of the screen.
  ///
  /// Example usage:
  /// ```dart
  /// double width = THelperFunctions.screenWidth();
  /// ```
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Formats the given [date] to the specified [format].
  ///
  /// Example usage:
  /// ```dart
  /// String formattedDate = THelperFunctions.getFormattedDate(DateTime.now());
  /// ```
  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // for getting formatted time from milliSecondsSinceEpochs String
  static String getFormattedTime(
      {required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return TimeOfDay.fromDateTime(date).format(context);
  }

  /// Removes duplicate items from the given [list].
  ///
  /// Example usage:
  /// ```dart
  /// List<int> uniqueList = THelperFunctions.removeDuplicates([1, 2, 2, 3, 3]);
  /// ```
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wraps a list of [widgets] into rows with a specified number of [rowSize] widgets per row.
  ///
  /// Example usage:
  /// ```dart
  /// List<Widget> rows = THelperFunctions.wrapWidgets([
  ///   Text('1'),
  ///   Text('2'),
  ///   Text('3'),
  ///   Text('4'),
  ///   Text('5'),
  ///   Text('6'),
  /// ], 3);
  /// ```
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
