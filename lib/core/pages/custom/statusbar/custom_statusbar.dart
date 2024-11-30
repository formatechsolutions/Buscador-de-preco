import '../colors_controller.dart';
import 'package:flutter/material.dart';

class CustomStatusbar extends StatelessWidget {
  final double nivel;

  const CustomStatusbar({super.key, required this.nivel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          FractionallySizedBox(
            widthFactor: nivel / 100,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsTheme.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
