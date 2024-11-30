import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../custom/appBar/simpleAppBar/simple_app_bar.dart';
import '../custom/button/custom_button.dart';
import '../custom/colors_controller.dart';
import '../custom/fields/custom_form_textfield.dart';
import '../custom/text/custom_subtitle_primary.dart';
import '../custom/text/custom_title_primary.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SimpleAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitlePrimary(text: 'Realizar Login'),
                    const CustomSubtitlePrimary(
                      text:
                          'Digite as suas informações pessoais\npara ter acesso ao BuscaPreço.',
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Email',
                      icon: Icons.email,
                      controller: _controller.emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Senha',
                      icon: Icons.lock,
                      isPassword: true,
                      controller: _controller.passwordController,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Esqueceu sua senha? ',
                            style: TextStyle(
                              color: ColorsTheme.textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: ColorsTheme.textGrey,
                              ),
                              children: [
                                TextSpan(
                                  text: "Redefinir",
                                  style: const TextStyle(
                                    color: ColorsTheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _controller.goToResetPasswordPage(context);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () => _controller.login(context),
              text: 'Entrar',
              colorButton: ColorsTheme.primary,
              colorBackground: true,
              buttonEnum: CustomButtonEnum.secondary,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
