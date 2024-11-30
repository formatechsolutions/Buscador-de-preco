import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  var registerPageEtapa = 0.obs;

  void goToRegisterPageEtapa(int etapa) {
    registerPageEtapa.value = etapa;
  }
}