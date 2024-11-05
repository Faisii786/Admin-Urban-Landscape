import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? ontap;
  const CustomBackButton({
    super.key,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
