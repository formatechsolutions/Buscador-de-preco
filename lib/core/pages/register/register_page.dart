// ignore_for_file: unrelated_type_equality_checks

import 'package:busca_preco/core/pages/errors/404/error_404.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:get/get.dart';

import '../custom/appBar/simpleAppBar/simple_app_bar.dart';
import '../custom/button/custom_button.dart';
import '../custom/colors_controller.dart';
import '../custom/fields/custom_form_textfield.dart';
import '../custom/statusbar/custom_statusbar.dart';
import '../custom/text/custom_subtitle_primary.dart';
import '../custom/text/custom_title_primary.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterPageController controller = Get.put(RegisterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.registerPageEtapa == 0) {
          return Scaffold(
            body: Column(
              children: [
                const CustomStatusbar(nivel: 10),
                SimpleAppBar(
                  customOnpressed: () {
                    controller.registerPageEtapa--;
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTitlePrimary(text: 'Crie uma conta'),
                          const CustomSubtitlePrimary(
                            text:
                                'Adicione suas informações para\ncompletar o seu registro.',
                          ),
                          const SizedBox(height: 20),
                          CustomFormTextfield(
                            text: 'Nome Completo',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 20),
                          CustomFormTextfield(text: 'Email', icon: Icons.email),
                          const SizedBox(height: 20),
                          CustomFormTextfield(
                            text: 'Senha',
                            icon: Icons.lock,
                            isPassword: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              CustomFormTextfield(
                                text: 'DDD',
                                width: 100,
                                centerText: true,
                                type: CustomFormTextfieldEnum.number,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomFormTextfield(
                                  text: 'Telefone',
                                  icon: Icons.phone,
                                  type: CustomFormTextfieldEnum.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    onPressed: () {
                      controller.registerPageEtapa++;
                    },
                    text: 'Avançar',
                    colorButton: ColorsTheme.primary,
                    colorBackground: true,
                    buttonEnum: CustomButtonEnum.secondary,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        } else if (controller.registerPageEtapa == 1) {
          return const Scaffold(
            body: Center(
              child: Text('Second'),
            ),
          );
        } else {
          return const Scaffold(appBar: SimpleAppBar(), body: Error404());
        }
      }),
    );
  }
}
