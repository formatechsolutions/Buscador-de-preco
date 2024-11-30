import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_text_field_code.dart';
import 'package:busca_preco/core/pages/custom/statusbar/custom_statusbar.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdForm extends StatelessWidget {
  ThirdForm({super.key});

  final RegisterPageController controller = Get.find<RegisterPageController>();

  final RxInt codes = 0.obs;

  final List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomStatusbar(nivel: 60),
              SimpleAppBar(
                customOnpressed: () {
                  controller.registerPageEtapa--;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitlePrimary(text: 'Você está quase lá!'),
                        const CustomSubtitlePrimary(
                          text:
                              'Um código foi enviado para o seu\ngmail, digite ele logo abaixo:',
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index) {
                            return SizedBox(
                              width: 50,
                              child: CustomTextFieldCode(
                                controllers: controllers,
                                focusNodes: focusNodes,
                                index: index,
                                codes: codes,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Nao recebeu o codigo?',
                                style: TextStyle(
                                  color: ColorsTheme.textBlack,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  ' Reenviar',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 300),
                    Center(
                      child: CustomButton(
                        onPressed: () {
                          if (codes.value == 5) {
                            controller.registerPageEtapa++;
                          } else {
                            Get.snackbar(
                              "Atenção",
                              "Você deve adicionar todos os códigos",
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        },
                        colorBackground: true,
                        text: 'Avançar',
                        buttonEnum: codes.value == 5
                            ? CustomButtonEnum.primary
                            : CustomButtonEnum.disabled,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
