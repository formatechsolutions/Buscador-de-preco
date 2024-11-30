import 'package:busca_preco/core/backend/backend_connection.dart';
import 'package:busca_preco/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BackendConnection backendConnection = BackendConnection();

  bool validateFields() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> login(BuildContext context) async {
    if (validateFields()) {

      backendConnection
          .login(emailController.text, passwordController.text)
          .then((value) => {
                if (value != null)
                  {
                    Get.snackbar(
                      'Acesso realizado!',
                      'Login realizado com sucesso!',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    ),
                    Get.toNamed(Routes.dashboard)
                  }
                else
                  {
                    Get.snackbar(
                      'Erro!',
                      'Email ou senha inválidos.',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    )
                  }
              });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Erro"),
          content: const Text("Por favor, preencha todos os campos."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void goToResetPasswordPage(BuildContext context) {
    Get.toNamed(Routes.resetPassword);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
