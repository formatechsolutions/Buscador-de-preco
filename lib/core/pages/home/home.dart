// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
            color: colorController.backgroundColor.value,
          )),
    );
  }
}
