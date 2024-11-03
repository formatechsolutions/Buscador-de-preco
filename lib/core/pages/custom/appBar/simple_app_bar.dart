// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/pages/custom/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ColorController _colorController = Get.put(ColorController());

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          backgroundColor: _colorController.backgroundColor.value,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: ColorsConfig.textBlack,
            onPressed: () => Get.back(),
          ),
        ));
  }
}
