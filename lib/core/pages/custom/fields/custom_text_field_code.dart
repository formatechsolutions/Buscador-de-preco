import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldCode extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int index;
  final RxInt codes;

  const CustomTextFieldCode(
      {super.key,
      required this.controllers,
      required this.focusNodes,
      required this.index,
      required this.codes});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllers[index],
      focusNode: focusNodes[index],
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: const InputDecoration(
        counterText: '',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty && controllers[index].text.length == 1) {
          if (codes.value < 5) codes.value++;
          if (index < 4) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }
        } else if (value.isEmpty) {
          if (codes.value > 0) codes.value--;
          if (index > 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
        }
        print(codes.value);
      },
    );
  }
}
