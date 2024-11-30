import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  RxBool isObscured = true.obs;

  void toggleVisibility() {
    isObscured.value = !isObscured.value;
  }
}
