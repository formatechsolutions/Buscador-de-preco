import '../colors_controller.dart';
import 'package:flutter/material.dart';

class CustomSubtitlePrimary extends StatelessWidget {
  final String text;

  const CustomSubtitlePrimary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: ColorsTheme.textBlack,
        fontFamily: 'Poppins',
      ),
    );
  }
}
