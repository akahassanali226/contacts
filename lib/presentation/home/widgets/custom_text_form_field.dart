// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextInputAction textInputAction;
  TextInputType textInputType;
  String? Function(String?)? validator;
  String hintText;
  TextEditingController controller;

  CustomTextFormField({
    super.key,

    required this.textInputAction,
    required this.textInputType,
    required this.validator,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorManager.lightBlueColor,
      style: StyleManager.titleMedium,
      autocorrect: true,

      textInputAction: textInputAction,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: StyleManager.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.goldColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.goldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.lightBlueColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.redColor),
        ),
      ),
    );
  }
}
