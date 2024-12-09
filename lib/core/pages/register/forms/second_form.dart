// ignore_for_file: must_be_immutable

import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/notification/custom_notification.dart';
import 'package:busca_preco/core/pages/custom/statusbar/custom_statusbar.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondForm extends StatelessWidget {
  SecondForm({super.key});

  final RegisterPageController controller = Get.find();
  final RxBool _isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomStatusbar(nivel: 30),
              SimpleAppBar(
                customOnpressed: () {
                  controller.registerPageEtapa--;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTitlePrimary(text: 'Você está quase lá!'),
                      const CustomSubtitlePrimary(
                        text:
                            'Adicione suas informações para\ncompletar o seu registro.',
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextfield(
                        type: CustomFormTextfieldEnum.number,
                        text: 'CPF ou CNPJ',
                        icon: Icons.badge,
                        controller: controller.cpfController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextfield(
                        type: CustomFormTextfieldEnum.number,
                        text: 'CEP',
                        icon: Icons.place,
                        controller: controller.cepController,
                      ),
                      const SizedBox(height: 20),
                      CustomFormTextfield(
                        text: 'Endereço',
                        icon: Icons.location_city,
                        controller: controller.addressController,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isChecked.value,
                      onChanged: (value) {
                        _isChecked.value = value ?? false;
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    const SizedBox(width: 4),
                    const Text('Eu concordo com a'),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Política de Privacidade'),
                    ),
                    const SizedBox(width: 4),
                    const Text('e'),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Termos de Uso'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onPressed: () {
                    if (!EmailValidator.validate(
                        controller.emailController.text)) {
                      showCustomNotification(
                          type: CustomNotificationEnum.error,
                          message: "Por favor, insira um e-mail válido.");
                      return;
                    } else if (!controller
                        .validateFields(controller.registerPageEtapa.value)) {
                      showCustomNotification(
                          type: CustomNotificationEnum.error,
                          message: "Por favor, preencha todos os campos.");
                      return;
                    } else {
                      if (_isChecked.value) {
                        controller.goToNextRegisterPageEtapa();
                      } else {
                        showCustomNotification(
                            type: CustomNotificationEnum.error,
                            message:
                                "Você deve aceitar os termos de uso e privacidade.");
                      }
                    }
                  },
                  colorBackground: true,
                  text: 'Avançar',
                  buttonEnum: _isChecked.value
                      ? CustomButtonEnum.primary
                      : CustomButtonEnum.disabled,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
