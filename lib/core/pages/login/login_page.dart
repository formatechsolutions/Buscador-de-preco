// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:busca_preco/core/pages/custom/appBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final ColorController colorController = ColorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: Obx(() => Container(
            color: colorController.backgroundColor.value,
          )),
    );
  }
}