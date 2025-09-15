// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/presentation/home/widgets/custom_user_field.dart';
import 'package:flutter/material.dart';

class CustomUserInfo extends StatelessWidget {
  String userNameText;
  String emailText;
  String passwordText;
  CustomUserInfo({
    super.key,
    required this.userNameText,
    required this.emailText,
    required this.passwordText,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomUserField(text: userNameText),
          Divider(color: ColorManager.goldColor, height: height * 0.03),
          CustomUserField(text: emailText),
          Divider(color: ColorManager.goldColor, height: height * 0.03),

          CustomUserField(text: passwordText),
        ],
      ),
    );
  }
}
