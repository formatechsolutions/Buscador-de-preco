import '../../colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? customOnpressed;

  const SimpleAppBar({super.key, this.customOnpressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Center(
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ColorsTheme.textBlack,
          onPressed: () => customOnpressed != null ? customOnpressed!() : Get.back(),
        ),
      ),
    );
  }
}