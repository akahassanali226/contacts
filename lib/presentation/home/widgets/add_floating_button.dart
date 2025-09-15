// ignore_for_file: must_be_immutable

import 'package:contacts/core/utils/color_manager.dart';
import 'package:contacts/presentation/home/data/contact_model.dart';
import 'package:contacts/presentation/home/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddFloatingButton extends StatelessWidget {
  TextEditingController userNameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  GlobalKey<FormState> formKey;

  Function(ContactModel) onContactAdded;

  AddFloatingButton({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    required this.formKey,

    required this.onContactAdded,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final result = await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return CustomBottomSheet(
                  userNameController: userNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  formKey: formKey,
                  contactModelist: [],
                );
              },
            );
          },
        );
        if (result != null) {
          onContactAdded(result); // 👈 notify parent (HomeView)
        }
      },

      backgroundColor: ColorManager.goldColor,
      child: Icon(Icons.add, color: ColorManager.darkBlueColor),
    );
  }
}
