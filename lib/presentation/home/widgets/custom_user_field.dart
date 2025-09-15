// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomUserField extends StatelessWidget {
  String text;
  CustomUserField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: StyleManager.titleMedium);
  }
}
