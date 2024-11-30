import '../colors_controller.dart';
import 'package:flutter/material.dart';

class CustomTitlePrimary extends StatelessWidget {
  final String text;

  const CustomTitlePrimary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: ColorsTheme.textBlack,
        fontFamily: 'Poppins',
      ),
    );
  }
}
