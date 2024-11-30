import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busca_preco/core/backend/backend_connection.dart';

class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final token = ''.obs;

  final BackendConnection backendConnection = BackendConnection();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String generateRandomToken() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(32, (index) => characters[random.nextInt(characters.length)]).join();
  }

  Future<void> generateUniqueToken() async {
    String generatedToken = generateRandomToken();
    bool tokenExists = await backendConnection.checkTokenExists(generatedToken);

    if (!tokenExists) {
      return generateUniqueToken();
    }

    token.value = generatedToken;
  }

  void resetPassword() {
    generateUniqueToken().then((_) {
      backendConnection.sendEmailResetPassword(emailController.text, token.value).then((_) => {
        Get.snackbar('Atenção', 'Email enviado com sucesso!', backgroundColor: Colors.green, colorText: Colors.white),
      });
    });
  }
}