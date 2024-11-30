import '../app_style_configuration.dart';
import '../colors_controller.dart';
import 'password_visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum CustomFormTextfieldEnum {
  number,
}

class CustomFormTextfield extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? isPassword;
  final PasswordVisibilityController _controller =
      Get.put(PasswordVisibilityController());
  final double? width;
  final bool? centerText;
  final CustomFormTextfieldEnum? type;
  final TextEditingController? controller;

  CustomFormTextfield({
    super.key,
    required this.text,
    this.controller,
    this.icon,
    this.isPassword,
    this.width,
    this.centerText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (isPassword == true) {
      return Obx(
        () => SizedBox(
          width: width,
          child: TextField(
            controller: controller,
            obscureText: _controller.isObscured.value,
            style: const TextStyle(
              color: ColorsTheme.inputDefaultColor,
              fontFamily: AppStyleConfiguration.defaultFont,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5,
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(
                color: ColorsTheme.inputDefaultColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontFamily: AppStyleConfiguration.defaultFont,
                decoration: TextDecoration.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: ColorsTheme.inputDefaultColor,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: ColorsTheme.primary,
                  width: 2.0,
                ),
              ),
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: ColorsTheme.inputDefaultColor,
                    )
                  : null,
              suffixIcon: IconButton(
                icon: Icon(
                  _controller.isObscured.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: ColorsTheme.inputDefaultColor,
                ),
                onPressed: _controller.toggleVisibility,
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          keyboardType: type == CustomFormTextfieldEnum.number
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters: type == CustomFormTextfieldEnum.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : [],
          textAlign: centerText == true ? TextAlign.center : TextAlign.start,
          style: const TextStyle(
            color: ColorsTheme.inputDefaultColor,
            fontFamily: AppStyleConfiguration.defaultFont,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
              color: ColorsTheme.inputDefaultColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontFamily: AppStyleConfiguration.defaultFont,
              decoration: TextDecoration.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: ColorsTheme.inputDefaultColor,
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: ColorsTheme.primary,
                width: 2.0,
              ),
            ),
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    color: ColorsTheme.inputDefaultColor,
                  )
                : null,
          ),
        ),
      );
    }
  }
}
