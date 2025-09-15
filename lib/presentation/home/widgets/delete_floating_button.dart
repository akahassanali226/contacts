// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class DeleteFloatingButton extends StatelessWidget {
  VoidCallback onContactdeleted;

  DeleteFloatingButton({super.key, required this.onContactdeleted});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onContactdeleted,
      backgroundColor: ColorManager.redColor,
      child: Icon(Icons.delete, color: ColorManager.goldColor),
    );
  }
}
