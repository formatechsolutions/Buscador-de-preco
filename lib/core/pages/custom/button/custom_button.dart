import '../app_style_configuration.dart';
import '../colors_controller.dart';
import 'package:flutter/material.dart';

enum CustomButtonEnum {
  primary,
  secondary,
  disabled,
}

class CustomButton extends StatelessWidget {
  final CustomButtonEnum buttonEnum;
  final VoidCallback? onPressed;
  final bool colorBackground;
  final Color? colorButton;
  final String text;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.colorButton,
    required this.colorBackground,
    this.buttonEnum = CustomButtonEnum.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (buttonEnum == CustomButtonEnum.primary ? 0.6 : (buttonEnum == CustomButtonEnum.disabled ? 0.6 : 0.8)),
      child: OutlinedButton(
        onPressed: buttonEnum == CustomButtonEnum.disabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(
            buttonEnum == CustomButtonEnum.primary ? 25.0 : (buttonEnum == CustomButtonEnum.disabled ? 25.0 : 15.0),
          ),
          side: BorderSide(
            color: colorButton ?? Colors.transparent,
            width: 2.0,
          ),
          backgroundColor: colorBackground ? (buttonEnum == CustomButtonEnum.disabled ? ColorsTheme.buttonGrey : (colorButton ?? ColorsTheme.primary)) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyleConfiguration.borderRadiusButton),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorBackground ? ColorsTheme.textWhite : colorButton,
            fontSize: buttonEnum == CustomButtonEnum.primary ? 14.0 : (buttonEnum == CustomButtonEnum.disabled ? 14.0 : 18.0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
